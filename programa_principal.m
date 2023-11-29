clear; close all; clc;

% Entrada da mensagem
palavra = [1 0 1 1];

% Calcula o número de bits de dados
num_bits_dados = length(palavra);

% Calcula o número de bits de paridade necessário
num_bits_parity = 1;
while 2^num_bits_parity < num_bits_dados + num_bits_parity + 1
    num_bits_parity = num_bits_parity + 1;
end

% Calcula o tamanho total da palavra de código
tam_total = num_bits_dados + num_bits_parity;

% Gera a palavra de código aplicando à função encode
code = encode(palavra, tam_total, num_bits_dados, 'hamming');

% Dada a palavra codificada, aplico à função decode para obter a mensagem original
decode_original = decode(code, tam_total, num_bits_dados, 'hamming');

% Introduzindo erros artificiais
pos_erros = [2, 5];  % Posições dos bits que serão modificados
code_erro = code;
code_erro(pos_erros) = ~code_erro(pos_erros);  % Inverte os bits nas posições especificadas

% Dada a palavra codificada com erros, aplico à função decode para obter a mensagem decodificada
decode_erro = decode(code_erro, tam_total, num_bits_dados, 'hamming');

% Exibe os resultados
disp('palavra original:');
disp(palavra);
disp('------------------');
disp('palavra codificada:');
disp(code);
disp('------------------');
disp('palavra decodificada (sem erros):');
disp(decode_original);
disp('------------------');
disp('palavra codificada com erros:');
disp(code_erro);
disp('------------------');
disp('palavra decodificada (com erros corrigidos):');
disp(decode_erro);
