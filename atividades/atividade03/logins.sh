#!/bin/bash
grep -v "sshd." auth.log
grep -E "*sshd.*Accepted.*\bj" auth.log
grep -E "sshd.*root" auth.log
grep -E "09-29.*Accepted" auth.log