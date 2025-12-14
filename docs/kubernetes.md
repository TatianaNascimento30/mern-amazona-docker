# Kubernetes (AWS EKS)

## Visão Geral
A aplicação foi implantada em um **cluster Kubernetes no AWS EKS**, utilizando manifests declarativos para gerenciar os componentes da solução.

O objetivo do uso do Kubernetes neste projeto é demonstrar:
- orquestração de containers
- separação de responsabilidades
- boas práticas de configuração
- integração com CI/CD

---

## Estrutura dos Manifests
Os arquivos Kubernetes estão organizados na pasta `k8s/`:

- `mongo.yaml`  
  Deployment e Service do MongoDB.

- `backend-deployment.yaml`  
  Deployment do backend Node.js.

- `backend-service.yaml`  
  Service para expor o backend internamente no cluster.

- `frontend-deployment.yaml`  
  Deployment do frontend React.

- `frontend-service.yaml`  
  Service para expor o frontend.

- `backend-configmap.yaml`  
  Configurações não sensíveis do backend.

- `backend-secret.yaml`  
  Variáveis sensíveis do backend (valores DEV/placeholder).

---

## Boas Práticas Aplicadas
Durante a implementação foram adotadas as seguintes boas práticas:

- **ConfigMap e Secret**  
  Separação entre configurações não sensíveis e sensíveis.

- **Health Checks**
  - `readinessProbe`
  - `livenessProbe`  
  Utilizados para garantir a disponibilidade da aplicação.

- **Gerenciamento de Recursos**
  - `requests` e `limits` de CPU e memória definidos nos containers.

- **Imagens Externas**
  As imagens Docker são publicadas no Docker Hub e consumidas pelo cluster Kubernetes.

---

## Aplicação dos Manifests
A aplicação dos manifests foi realizada manualmente utilizando `kubectl`, na seguinte ordem:

```bash
kubectl apply -f k8s/mongo.yaml
kubectl apply -f k8s/backend-configmap.yaml
kubectl apply -f k8s/backend-secret.yaml
kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/backend-service.yaml
kubectl apply -f k8s/frontend-deployment.yaml
kubectl apply -f k8s/frontend-service.yaml

Validação do Deploy

Após a aplicação dos manifests, foram utilizados os seguintes comandos para validação:

kubectl get pods
kubectl get svc

Acesso à Aplicação

Para evitar custos adicionais com serviços de exposição externa (LoadBalancer), foi utilizado o recurso de port-forward para validação:

kubectl port-forward svc/frontend 3000:3000


A aplicação pode ser acessada em:

http://localhost:3000

Evidências

As evidências de funcionamento (prints e logs) estão documentadas em:

docs/evidencias.md

docs/evidencias/


---

##  Próximo passo
1️ Salve o arquivo  
2️ No terminal, rode:

```powershell
git status