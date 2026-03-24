echo
echo "Executando a Questão 1:"
cd q1
awk -F: -f disciplina.awk notas.txt

sleep 3

echo 
echo "Executando a Questão 2:"
cd .. && cd q2
awk -f latencia.awk ips_latencia.txt

sleep 3

echo
echo "Executando a Questão 3:"
cd .. && cd q3
awk -F\; -f faturamento.awk vendas.txt

