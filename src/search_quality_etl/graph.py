from diagrams import Diagram, Cluster
from diagrams.aws.compute import EC2
from diagrams.aws.database import RDS
from diagrams.aws.network import ELB
from diagrams.aws.storage import S3
from diagrams.onprem.workflow import Airflow




with Diagram("Grouped Workers", show=False, direction="TB"):
    di_store = S3('DI DataLake')

    with Cluster('DI Airflow Cluster'):
        di_store >> Airflow('DI')
