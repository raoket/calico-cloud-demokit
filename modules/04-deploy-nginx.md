# 04 — Deploy NGINX Ingress Controller

In this step, we’ll deploy the NGINX Ingress Controller to enable external access to our applications via a single load balancer and ingress rules.

---

## Steps

1. **Make the script executable**

```bash
chmod +x scripts/deploy-nginx.sh
```

2. **Run the deployment script**

```bash
bash scripts/deploy-nginx.sh
```

This script will:

* Create the `ingress-nginx` namespace
* Add and update the official NGINX Helm repository
* Deploy the NGINX Ingress Controller with cross-cloud defaults
* Output the LoadBalancer’s external IP/hostname for use in ingress resources

---

## Deploy Ingress Resources for Applications

Once the controller is ready, apply the ingress manifests for each application:

```bash
kubectl apply -f ingress/online-boutique-ingress.yaml
kubectl apply -f ingress/yaobank-ingress.yaml
kubectl apply -f ingress/bookinfo-ingress.yaml
```

**Online Boutique** routes (path-based):

* `/` → Boutique homepage (fixes logo redirect)
* `/product/...` → Product detail pages
* `/cart` → Shopping cart
* `/checkout` → Checkout flow

**Other applications:**

* `/bank` → YaoBank  
* `/books` → Bookinfo  

---

## Validation

1. **Check controller status**

```bash
kubectl -n ingress-nginx get pods
kubectl -n ingress-nginx get svc ingress-nginx-controller -o wide
```

Expect controller pods `Running` and the `ingress-nginx-controller` service to have an external IP/hostname.  

⚠️ **Note**: On cloud providers (AWS, GCP, Azure), it may take **2–5 minutes** for the LoadBalancer service to provision and the DNS hostname to become reachable. If the EXTERNAL-IP/hostname shows up but isn’t responding yet, wait a bit — this is normal.

2. **Browse or curl**

```bash
# Replace <LB-IP-or-hostname> with the EXTERNAL-IP/hostname from the Service
open http://<LB-IP-or-hostname>/          # Boutique homepage
open http://<LB-IP-or-hostname>/bank      # YaoBank
open http://<LB-IP-or-hostname>/books     # Bookinfo

# or with curl:
curl -sI http://<LB-IP-or-hostname>/          | head -n1
curl -sI http://<LB-IP-or-hostname>/product   | head -n1
curl -sI http://<LB-IP-or-hostname>/cart      | head -n1
curl -sI http://<LB-IP-or-hostname>/checkout  | head -n1
```

If a path returns a non-200, run:

```bash
kubectl -n <ns> get ingress
kubectl -n <ns> describe ingress <name>
kubectl -n <ns> get svc,deploy,pod -o wide
```

---

## Navigation

⬅️ [03 — Deploy Applications](./03-deploy-apps.md)  
➡️ [05 — Tiers & Policies](./05-tiers-and-policies.md)
