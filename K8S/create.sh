helm repo add bitnami https://charts.bitnami.com/bitnami
helm update
helm install mongodb bitnami/mongodb


#MongoDB can be accessed via port 27017 on the following DNS name(s) from within your cluster:
#
#    mongodb.zenbot.svc.cluster.local
#
#To get the root password run:
#
 export MONGODB_ROOT_PASSWORD=$(kubectl get secret --namespace zenbot mongodb -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
 echo $MONGODB_ROOT_PASSWORD
#
#To connect to your database, create a MongoDB client container:
#
#    kubectl run --namespace zenbot mongodb-client --rm --tty -i --restart='Never' --image docker.io/bitnami/mongodb:4.4.0-debian-10-r0 --command -- bash
#
#Then, run the following command:
#    mongo admin --host "mongodb" --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD
#
#To connect to your database from outside the cluster execute the following commands:
#
#    kubectl port-forward --namespace zenbot svc/mongodb 27017:27017 &
#    mongo --host 127.0.0.1 --authenticationDatabase admin -p $MONGODB_ROOT_PASSWORD
