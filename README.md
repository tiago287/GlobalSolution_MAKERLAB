# Braço Robótico para Microgravidade 🪐 | Global Solution MakerLab

## 1. Identificação do Grupo
* Tiago Rafael Paulino Ferreira (RM551169)
* João Pedro Cruz (RM98650)
* Victor Eid (RM98668)
* Enzo Luiz Goulart (RM99666)

## 2. Acesso ao Simulador
* **Link do projeto no Tinkercad:** https://www.tinkercad.com/things/0fTvFYgKa5c-circuito-
*(O circuito está configurado como público para avaliação).*

## 3. Como operar o braço (Comandos)
Toda a operação do braço é feita pelo Monitor Serial do Arduino. Para enviar uma amostra, basta digitar os comandos abaixo:
* `U` ou `u` (Up): Levanta a articulação principal do braço.
* `D` ou `d` (Down): Abaixa a articulação principal do braço.
* `O` ou `o` (Open): Abre a garra para capturar o objeto.
* `C` ou `c` (Close): Fecha a garra.

## 4. Modelagem 3D (OpenSCAD)
A modelagem foi desenvolvida de forma paramétrica via código no software **OpenSCAD**. O design foca na aplicação espacial, utilizando furos de "alívio de massa" para reduzir o peso das peças. O modelo também inclui os recortes estruturais exatos (24x13mm) para o encaixe perfeito dos servomotores micro de 9g.

## 5. Especificações Técnicas (Eletrônica)
* **Alimentação:** Para não queimar o regulador de tensão do Arduino, usamos uma fonte de bancada externa configurada em **5V** dedicada apenas para os motores (com o GND compartilhado com a placa).
* **Pino Digital 9:** Controla o servo do braço (cabo amarelo).
* **Pino Digital 10:** Controla o servo da garra (cabo laranja).
* **Pino Digital 8:** Controla o LED que confirma o recebimento dos comandos (cabo verde).
