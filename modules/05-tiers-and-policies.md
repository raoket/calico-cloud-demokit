# 05 — Apply Network Policies with Calico 🔐

Zero Trust rollout using **Calico tiers** in order: **security → platform → application → appsec**.
All commands use `kubectl` and match this repo layout:

```
scripts/tiers.yaml
policies/
  1.default-tier/
  2.security/
  3.platform/
  4.application/
  5.appsec/
```

---

## 1) Create tiers 🗂️

```bash
kubectl apply -f scripts/tiers.yaml
kubectl get tiers.projectcalico.org
```

**Tiers (top → bottom):** `security`, `platform`, `application`, `appsec`

---

## 2) (Optional) Default-tier bootstrap ⚙️

> If you intend to start permissive and tighten later, apply your repo’s default-tier rules first.

```bash
kubectl apply -f policies/1.default-tier/
```

**One‑liners:**

* `tenant-1-default-allow` — allow tenant‑1 namespaces upward (workshop-friendly baseline)
* `tenant-2-default-allow` — allow tenant‑2 namespaces upward

---

## 3) Security tier 🔒

```bash
kubectl apply -f policies/2.security/
```

**One‑liners:**

* `security-default-pass` — final **Pass** in security tier (let higher tiers decide)
* `block-alienvault-ipthreatfeed` — deny egress to known‑bad IPs (OTX list)
* `tenant-1-pass-all` / `tenant-2-pass-all` — pass traffic from the two tenant groups to upper tiers

---

## 4) Platform tier ⚙️

```bash
kubectl apply -f policies/3.platform/
```

**One‑liners:**

* `platform-default-pass` — final **Pass** in platform tier (avoid infra lockouts)
* `cluster-dns-allow-all` — allow DNS to kube-dns across namespaces
* `ingress` — allow **ingress-nginx** to receive from Internet and egress to app namespaces

---

## 5) Application tier 🛠️

```bash
kubectl apply -f policies/4.application/
```

**One‑liners:**

* `platform-default-pass` — (as authored in repo) safe Pass in this tier
* `tenant-1-yaobank-allow` — allow YaoBank UI ↔ API and required egress

---

## 6) AppSec tier 🛡️ (Online Boutique fine‑grained)

```bash
kubectl apply -f policies/5.appsec/
```

**One‑liners:**

* `frontend` — allow frontend → (productcatalog, currency, cart, checkout, ad, recommendation)
* `adservice` — restrict to 9555/TCP from approved callers
* `cartservice` — only 7070/TCP from frontend/checkout
* `checkoutservice` — only required upstreams/downstreams (product, ship, payment, currency, cart)
* `currencyservice` — only 7000/TCP from approved internals
* `emailservice` — only from checkout to 5000/TCP
* `loadgenerator` — may hit frontend, no lateral moves
* `paymentservice` — only from checkout to 50051/TCP
* `productcatalogservice` — 3550/TCP to approved callers
* `recommendationservice` — 8080/TCP to/from allowed services
* `redis-cart` — 6379/TCP only from cartservice
* `shippingservice` — only from checkout to 50051/TCP

---

## 7) Verify ✅

```bash
# Tiers (priority ordering)
kubectl get tiers.projectcalico.org

# Calico namespace-scoped policies
kubectl get networkpolicies.crd.projectcalico.org -A

# Calico global policies (cluster/global scope)
kubectl get globalnetworkpolicies.crd.projectcalico.org -A
```

> 🔎 Note: `kubectl get networkpolicies -A` will show nothing because we’re using **Calico CRDs** (Calico NetworkPolicy / GlobalNetworkPolicy), not vanilla Kubernetes `NetworkPolicy`.

### What you should see (quick reference)

| Command                                                      | Expectation                                                                                                                                                                                     |
| ------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `kubectl get tiers.projectcalico.org`                        | Tiers in order: **security**, **platform**, **application**, **appsec**                                                                                                                         |
| `kubectl get networkpolicies.crd.projectcalico.org -A`       | In **online-boutique**: `appsec.*` policies (frontend, cartservice, checkoutservice, …). In **ingress-nginx**: `platform.ingress`. In **yaobank**: `application.tenant-1-yaobank-allow`.        |
| `kubectl get globalnetworkpolicies.crd.projectcalico.org -A` | Global guardrails: `security.*` (e.g., `security-default-pass`, `block-alienvault-ipthreatfeed`, tenant pass rules), and `platform.*` (e.g., `platform-default-pass`, `cluster-dns-allow-all`). |

---

## 8) Apply‑all helper & rollback 🧩

**Apply everything (ordered):**

```bash
cat > apply_all_policies.sh <<'EOF'
set -e
kubectl apply -f scripts/tiers.yaml
kubectl apply -f policies/1.default-tier/
kubectl apply -f policies/2.security/
kubectl apply -f policies/3.platform/
kubectl apply -f policies/4.application/
kubectl apply -f policies/5.appsec/
EOF
bash apply_all_policies.sh
```

**Rollback per tier:**

```bash
kubectl delete -f policies/5.appsec/ --ignore-not-found
kubectl delete -f policies/4.application/ --ignore-not-found
kubectl delete -f policies/3.platform/ --ignore-not-found
kubectl delete -f policies/2.security/ --ignore-not-found
kubectl delete -f policies/1.default-tier/ --ignore-not-found
```

> 🧭 Tip: apply one tier at a time, validate, then proceed — easier troubleshooting and a clearer story during demos.

---

## Navigation

⬅️ [04 — Deploy NGINX Ingress Controller](./04-deploy-nginx.md)
