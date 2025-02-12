[
  {
    "name": "${container_name}",
    "image": "${app_image}",
    "cpu": ${fargate_cpu},
    "memory": ${fargate_memory},
    "networkMode": "awsvpc",
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/${container_name}",
          "awslogs-region": "${aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "portMappings": [
      {
        "protocol": "tcp",
        "containerPort":${app_port},
        "hostPort":${app_port}
      },
      {
        "protocol": "tcp",
        "containerPort":4040,
        "hostPort":4040
      }
    ],
     "command": [
          "start-notebook.sh",
          "--NotebookApp.password=''",
          "--NotebookApp.token=''"
     ],
     "environment": [
        {
          "name": "JAVA_OPTS",
          "value": "-Xmx10g"
        }
    ],
    "secrets": [
        {
            "name": "ETL_CONF_AWS_ACCESS_KEY",
            "valueFrom": "${access_key_arn}"          
        },
        {
            "name": "ETL_CONF_AWS_ACCESS_SECRET",
            "valueFrom": "${access_secret_arn}"          
        }
    ]
  }
]
