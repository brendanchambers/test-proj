import torch
from mamba_ssm import Mamba
from transformers import AutoTokenizer, AutoModelForCausalLM

# successful import of torch and mamba_ssm

#######

# verify we can sync models from hf hub
model_name="state-spaces/mamba-130m-hf"

tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForCausalLM.from_pretrained(model_name, dtype=torch.float32)

messages = [
    {"role": "user", "content": "Unenlightened one: 'Please tell us something inscrutable, wise one.'\nSage: 'My siblings, you have traveled far and risked much. However, you should have"}, # trailing space is very bad, avoid trailing space
]

########

# hf has possible config issues with this model. double check the status of this issue.

print('tokenizing...')
# you can use a chat template if you like
# inputs = tokenizer.apply_chat_template(
#     messages,
#     add_generation_prompt=False,
#     tokenize=True,
#     return_dict=True,
#     return_tensors="pt",
# ).to(model.device)
# tokenize
inputs = tokenizer(
    messages[0]['content'],
    return_tensors="pt",
).to(model.device)

print('generating...')
outputs = model.generate(**inputs, max_new_tokens=100)
print('decoding generation...')
print(tokenizer.decode(outputs[0][inputs["input_ids"].shape[-1]:]))
print('ehfmg')

print('round trip tokenization:')
print(inputs['input_ids'])
print(inputs['input_ids'].cpu().numpy()[0,:])
print(tokenizer.decode(inputs['input_ids'].cpu().numpy()[0,:]))

# successful sanity check of mamba 2 generation