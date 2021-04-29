@echo off
rem Licensed under the Apache License, Version 2.0 (the "License");
rem you may not use this file except in compliance with the License.
rem You may obtain a copy of the License at
rem
rem      https://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.

@echo ------------ Pattern matching test ------------

java SimpleGrep ��߭�׻��� %PWD%\win_ko.txt
@echo --- Confirm that the line(s) includes "��߭�׻���". 
@echo --- Did you get the line(s) 11,12 and 47 ?

java SimpleGrep "��.*��" %PWD%\win_ko.txt
@echo --- Confirm that the line(s) includes the pattern "��*��". 
@echo --- Did you get the line(s) 11,12,47,48,50 and 52 ?

java SimpleGrep "^��" %PWD%\win_ko.txt
@echo --- Confirm that the line(s) starts with "��".
@echo --- Did you get the line 53,54 and 55 ?

java SimpleGrep ��� %PWD%\win_ko.txt
@echo --- Confirm that the line(s) includes half-width Katakana "���". 
@echo --- Did you get the line 19,20 and 39 ?

java SimpleGrep �� %PWD%\win_ko.txt
@echo --- Confirm that the line(s) includes "��" (full-width Yen symbol). 
@echo --- Did you get the line 24 and 66 ?

java SimpleGrep \\ %PWD%\win_ko.txt
@echo --- Confirm that the line(s) includes "\" (half-width Yen symbol). 
@echo --- Did you get the line 33 and 35 ?

java SimpleGrep "��.*��" %PWD%\win_ko.txt
@echo --- Confirm that the line(s) includes the pattern "��.*��". 
@echo --- Did you get the line 81 ?

java SimpleGrep ������ %PWD%\win_ko.txt
@echo --- Confirm that the line(s) includes "������". 
@echo --- Did you get the line 31 ?

java SimpleGrep [������] %PWD%\win_ko.txt
@echo --- Confirm that the line(s) includes any of ��,��,�� or ��. 
@echo --- Did you get the line 60,61 and 63 ?


@echo\
@echo ------------ Pattern replacement test ------------

java RegexReplaceTest ��߭�׻��� aiueo %PWD%\win_ko.txt -v
@echo --- Confirm that "��߭�׻���" was replaced by "aiueo". 
@echo --- OK ?

java RegexReplaceTest ��� �������� %PWD%\win_ko.txt -v
@echo --- Confirm that "���" was replaced by "��������". 
@echo --- OK ?

java RegexReplaceTest �� \\ %PWD%\win_ko.txt -v
@echo --- Confirm that "��" was replaced by "\". 
@echo --- OK ?

java RegexReplaceTest "��.*��" "����Ͻ���" %PWD%\win_ko.txt -v
@echo --- Confirm that "��.*��" was replaced by "����Ͻ���". 
@echo --- OK ?

java RegexReplaceTest ������ ��� %PWD%\win_ko.txt -v
@echo --- Confirm that "������" was replaced by "���". 
@echo --- OK ?

java RegexReplaceTest [������] ��� %PWD%\win_ko.txt -v
@echo --- Confirm that any of "������" were replaced by "���". 
@echo --- OK ?
