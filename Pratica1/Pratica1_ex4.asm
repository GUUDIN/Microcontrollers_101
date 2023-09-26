	org 00h; Saltar para a label do programa principal (main)
; Colocar a origem em 33h
; Inicializar o programa principal com a label informada anteriormente na operação de salto.
; Limpar o ACC
; Mover de forma imediata um valor qualquer para R0
; A partir daqui, separar o programa em blocos de códigos por meio de outras labels. Primeiramente, inicializar o primeiro bloco com uma nova label (ex.: “bloco1”)
; Saltar SE A = 0 para um o segundo bloco do programa (informar a label do segundo bloco nesta instrução. Ex.: bloco2)
; Na próxima linha (ainda no primeiro bloco), Saltar SE A ? 0 para um terceiro bloco (passar a label do terceiro bloco nesta instrução. Ex.: bloco3)
; Na próxima linha (ainda no primeiro bloco), consumir tempo de 1 µs (não realizar operação).
; Inicializar o segundo bloco com a label chamada anteriormente (para onde o programa irá saltar se A =0)
; Mover R0 para A
; Saltar de forma incondicional para o bloco 1 (passar a label do primeiro bloco).
; Inicializar o terceiro bloco com label chamada anteriormente (para onde o programa irá saltar se A ? 0)
; Decrementar e Saltar SE R0 ? 0 para a label do terceiro bloco (isto é, irá ficar em loop enquanto R0 ? 0, e sempre no terceiro bloco)
; Na próxima linha (no terceiro bloco), saltar de forma incondicional para a label do programa principal para reiniciar toda a operação.
; Encerrar o programa.
; Depurar o programa e descrever seu comportamento.
