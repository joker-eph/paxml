# coding=utf-8
# Copyright 2022 The Pax Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#! /bin/bash
set -u

TFDS_DATA_DIR=$1
VOCAB_PATH=$2
### path to pretrained log_dir
LOG_DIR=$3

export VOCAB_PATH=$VOCAB_PATH

mkdir -p ${PWD}/${LOG_DIR}
python3 -u -m paxml.main \
    --job_log_dir=${LOG_DIR} \
    --exp=paxml.contrib.gpu.scripts_gpu.configs.Lambada126M \
    --tfds_data_dir=$TFDS_DATA_DIR \
    --mode='eval' \
    --alsologtostderr &> ${LOG_DIR}/output.log

