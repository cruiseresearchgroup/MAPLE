
#!/bin/bash



python3 ./finetune.py \
--model_name_or_path  \  #path-to-pretrained-model
--model_name_or_path_st_one #path-to-pretrained-model-in-stage-1 \
--model_name_or_path_st_two #path-to-pretrained-model-in-stage-2-(output-of-stage1) \
--output_dir #path-to-output-dir \
--output_dir_st_one #path-to-output-dir-stage1 \
--output_dir_st_two #path-to-output-dir-stage2 \
--train_file #path-to-train-file (same as #path-to-train-file-stage1 ) \
--validation_file  #path-to-validate-file \
--train_file_st_one #path-to-train-file-stage1 \
--train_file_st_two #path-to-train-file-stage2 \
--source_prefix "summarize: " #using-summarize: \
--per_device_train_batch_size_st_one=64 #training-batch-size-stage-one \
--per_device_eval_batch_size_st_one=64 #eval-batch-size-stage-one \
--per_device_train_batch_size_st_two=16 #training-batch-size-stage-two\
--per_device_eval_batch_size_st_two=16 #eval-batch-size-stage-two \
--overwrite_output_dir t \
--predict_with_generate t \
--cache_dir #path-to-cache \
--save_total_limit 2 \
--save_steps 1000 \
--num_train_epochs 3 \


python3 ./predict.py \
--model_name_or_path #path-to-finetuned-model  \
--output_dir #path-to-output-dir \
--validation_file #path-to-validate-file \
--test_file #path-to-test-file \
--source_prefix "summarize: " \
--per_device_train_batch_size=12 #train-batch-size-stage-one \
--per_device_eval_batch_size=12 #eval-batch-size-stage-one \
--overwrite_output_dir t \
--predict_with_generate t \
--cache_dir #path-to-cache \
--save_total_limit 2 \
--save_steps 1000 \

