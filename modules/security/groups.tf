resource "aws_security_group" "polygon_internal" {
  name        = "Polygon_Edge_allow_internal_Testnet"
  description = "Allow Internal Traffic"
  vpc_id      = var.vpc_id


  ingress = [
    // allow internal libp2p communication
    {
      description      = "LibP2P Allow"
      from_port        = 1478
      to_port          = 1478
      protocol         = "tcp"
      self          = true
      cidr_blocks = []
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
    },

    // allow public access to the JSON-RPC API
    {
      description      = "Allow Public Access to nodes JSON-RPC"
      from_port        = 8545
      to_port          = 8545
      protocol         = "tcp"
      self          = false
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
    },
    // allow ssh access from Bastion instance
    {
      description      = "Allow SSH access from Bastion instance"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      self          = false
      cidr_blocks = []
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = [aws_security_group.bastion_public.id]
    },
  ]

  // egress not limited
  egress = [
    {
        description = "Allow all outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = true

    }
  ]

  tags = {
    Name = var.internal_sec_gr_name_tag
  }
}

resource "aws_security_group" "bastion_public" {
  name        = "Bastion_Public_Testnet"
  description = "Allow Bastion Admin Access"
  vpc_id      = var.vpc_id


  ingress = [
    // allow ssh access
    {
      description      = "SSH Allow Admin Access"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      self          = false
      cidr_blocks = [var.admin_public_ip, "109.245.33.184/32"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
    },
        // allow communication to the controller
    {
      description      = "Controller Allow"
      from_port        = 9001
      to_port          = 9001
      protocol         = "tcp"
      self          = false
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
    },
  ]

  // egress not limited
  egress = [
    {
        description = "Allow all outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = true

    }
  ]

  tags = {
    Name = var.bastion_sec_gr_name_tag
  }
}

resource "aws_security_group" "json_rpc_alb" {
  name        = "Polygon_Edge_JSONRPC_ALB_TESTNET"
  description = "Allow External Traffic to ALB"
  vpc_id      = var.vpc_id


  ingress = [
    // allow public https connection
    {
      description      = "Allow HTTPS"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      self          = true
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
    },
  ]

  // egress not limited
  egress = [
    {
        description = "Allow all outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = true

    }
  ]

  tags = {
    Name = var.alb_sec_gr_name_tag
  }
}

resource "aws_security_group" "databases" {
  name        = "Polygon_Edge_Databases_Testnet"
  description = "Allow Internal Traffic to DB"
  vpc_id      = var.vpc_id


  ingress = [
    // allow internal postgresql traffic
    {
      description      = "Allow POSTGRESQL"
      from_port        = 5432
      to_port          = 5432
      protocol         = "tcp"
      self          = false
      cidr_blocks = []
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = [
        aws_security_group.polygon_internal.id,
        aws_security_group.bastion_public.id,
        aws_security_group.blockscout_instance.id,
      ]
    },
  ]

  // egress not limited
  egress = [
    {
        description = "Allow all outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = true

    }
  ]

  tags = {
    Name = var.db_sec_gr_name_tag
  }
}

resource "aws_security_group" "blockscout_alb" {
  name        = "Blockscout ALB TestNet"
  description = "Allow Internet Traffic to Blockscout"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description      = "Allow Public Access to Blockscout instnce"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      self          = false
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
    }
  ]

  egress = [
    {
      description = "Allow all outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = true

    }
  ]

  tags = {
    Name = var.blockscout_alb_sec_gr_name_tag
  }
}

resource "aws_security_group" "blockscout_instance" {
  name        = "Blockscout Instance TestNet"
  description = "Allow Internal traffic to Blockscout instance"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description      = "Allow https traffic for Blockscout service"
      from_port        = 4001
      to_port          = 4001
      protocol         = "tcp"
      self          = false
      cidr_blocks = []
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = [aws_security_group.blockscout_alb.id,aws_security_group.bastion_public.id]
    },
    {
      description      = "Allow SSH traffic from Bastion to Blockscout instance"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      self          = false
      cidr_blocks = []
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = [aws_security_group.bastion_public.id]
    }
  ]

  egress = [
    {
      description = "Allow all outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = true

    }
  ]

  tags = {
    Name = var.blockscout_sec_gr_name_tag
  }
}

resource "aws_security_group" "grafana_instance" {
  name        = "Grafana Instance TestNet"
  description = "Allow Internal traffic to Grafana instance"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description      = "Allow InfluxDB traffic"
      from_port        = 8086
      to_port          = 8086
      protocol         = "tcp"
      self          = false
      cidr_blocks = []
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = [aws_security_group.polygon_internal.id]
    },
    {
      description      = "Allow Loki log collection traffic"
      from_port        = 3100
      to_port          = 3100
      protocol         = "tcp"
      self          = false
      cidr_blocks = []
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = [aws_security_group.polygon_internal.id]
    },
    {
      description      = "Allow SSH traffic from Bastion to Grafana instance"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      self          = false
      cidr_blocks = []
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = [aws_security_group.bastion_public.id]
    },
    {
      description      = "Allow Grafana HTTPS from ALB"
      from_port        = 3000
      to_port          = 3000
      protocol         = "tcp"
      self          = false
      cidr_blocks = []
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = [aws_security_group.grafana_alb.id]
    },
  ]

  egress = [
    {
      description = "Allow all outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = true

    }
  ]

  tags = {
    Name = var.grafana_sec_gr_name_tag
  }
}

resource "aws_security_group" "grafana_alb" {
  name        = "Grafana ALB TestNet"
  description = "Allow Internet Traffic to Grafana"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description      = "Allow Public Access to Grafana instnce"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      self          = false
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
    }
  ]

  egress = [
    {
      description = "Allow all outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = true

    }
  ]

  tags = {
    Name = var.grafana_alb_sec_gr_name_tag
  }
}

resource "aws_security_group_rule" "allow_prometheus_from_grafana" {
  from_port         = 5001
  to_port           = 5001
  protocol          = "tcp"
  source_security_group_id = aws_security_group.grafana_instance.id
  security_group_id = aws_security_group.polygon_internal.id
  type              = "ingress"
  description = "Allow Prometheus API access from Grafana"
}
