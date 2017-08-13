# Usage examples

These examples assume that you have all backend services and their dependencies 
running as described in the [README.md](README.md)

## Add sample data

For all backend services to work together with the charge box simulator and for receptionist to work, 
there needs to be some sample data in the Charge Box Service and the Pricing Service. You can 
add it by running the following script:

```
sample-data/fill-receptionist.sh
sample-data/fill-cbservice.sh
sample-data/fill-pricingservice.sh
```

You can also generate transactions for the SpaceX tenant:

```
pip install -r requirements-sample-data.txt
cd sample-data
./gen-tx-svc-sample-data.py
./fill-txservice.sh
```

This will generate a years worth of transactions for all charge points of that tenant

## Run the Charge Point simulator

_Abusive Charge Point_ is a command line app that simulates one or more 
charge boxes. It will exchange messages with Central System the same way 
real charge boxes would, so it will generate actual charge sessions.

Basic usage:

```
# from the abusive-charge-point directory
lein run "pool-config.json"
```

This will initialize the simulation with charge boxes that are defined in `resources/pool-config.json` and 
also start the simulation.

You can also add charge boxes manually:

```
acp# add "ws://localhost:8080/ws/5pVvHNXhpi0h06lcKqwGxi" "AMP-0004"
```

When you start Abusive Chargepoint without a json configuration, and only add charge boxes manually, 
you have to start the simulation manually as well:

```
acp# start
```

To stop:

```
acp# stop
```

## Use the API

To use the API you should first an Access Token from _Receptionist_:

```
CG_AT=$(http --form POST :8075/oauth/token username="debie.daan@gmail.com" password="isuck123" | jq ".access_token" | sed 's/"//g')
```

Request info about logged in user, and at the same time store headers in a 
session for later use:

```
http --session cg :8075/me "Authorization: Bearer $CG_AT"
```

Now you can do any API call, with the auth header automatically inserted, 
for example getting some transactions:

```
http --session cg ":8075/transactions"
```

