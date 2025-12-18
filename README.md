# Compositional Diffusion with Guided search for Long-Horizon Planning

[[Project page]](https://cdgsearch.github.io/)
[[Paper]](https://cdgsearch.github.io/materials/CDGS_anonymous.pdf)
[[ArXiv]](https://cdgsearch.github.io/)
<!-- [![][colab]][maze2d-eval-demo] -->
<!-- [[Data]]() -->
<!-- [Colab]() -->
<!-- declare varibles -->
<!-- [colab]: <https://colab.research.google.com/assets/colab-badge.svg> -->
<!-- [maze2d-eval-demo]: <https://colab.research.google.com/drive/1pARD89PfSzF3Ml6virZjztEJKWhXVkBY?usp=sharing> -->


[Utkarsh A. Mishra](https://umishra.me/),
[David He](),
[Yongxin Chen](https://yongxin.ae.gatech.edu/),
[Danfei Xu](https://faculty.cc.gatech.edu/~danfei/)

Georgia Tech


This is the official implementation for "*Compositional Diffusion with Guided search for Long-Horizon Planning*" for **OGbench** related experiments derived from [CompDiffuser](https://github.com/devinluo27/comp_diffuser_release).

**Compositional Diffusion with Guided search for Long-Horizon Planning**
We present a toy domain illustration here: [https://github.com/UtkarshMishra04/CDGS_toydomain](https://github.com/UtkarshMishra04/CDGS_toydomain)

## 🛠️ Installation
The following procedure should work well for a GPU machine with cuda 12.1. Our machine is installed with Ubuntu 20.04.6 LTS.

<!-- and loads the following modules:
```
1) zlib; 2) cuda/11.8.0; 3) git-lfs; 4) expat; 5) mesa/22.1.6; 6) libiconv; 7) ffmpeg; 8) glew;
```
For some other Linux versions, the equivalent modules might be required.  -->

Please follow the steps below to create a conda environment to reproduce our simulation benchmark results on OGBench environments.

1. Create a python env.
```console
conda create -n cdgs_ogbench python=3.9.20
```
Please keep the conda env name as above, since it is used as an identifier in the python code.

2. Install packages in `requirements.txt` (this might take several minutes).
```console
pip install -r conda_env/requirements.txt
```

3. Install gymnasium, gymnasium-robotics, and torch 2.5.0.
```console
./conda_env/install_pre.sh 
```

<!-- https://seohong.me/projects/ogbench/ -->
<!-- [official OGBench](https://seohong.me/projects/ogbench/) -->
4. Clone the CompDiffuser customized OGBench codebase [ogbench_cpdfu_release](https://github.com/devinluo27/ogbench_cpdfu_release)  and install it to conda env `cdgs_ogbench`. (Our major revision is adding some rendering code to the official OGBench.)
```console
## Please set the OGBench path in the script before running this line
./conda_env/install_ogb.sh
```

After these steps, you can use conda env `cdgs_ogbench` to launch experiments.

<!-- pip install -r requirements.txt -->

<!-- <p align="center">
  <img src="media/env_show-github.png" alt="Alternative text"  width="75%" >
</p> -->

<!-- 📦 🗃️ 📥 🗂️ 🧩 🎨 🔮 -->

## 📊 Using Pretrained Models


### Downloading weights
Since CDGS is a training-free method, one can directly use pre-trained CompDiffuser planner and inverse dynamics models below, along with their corresponding config files. All models are hosted under this OneDrive [folder](https://1drv.ms/f/c/b25b9b5879968c8a/EskQ59ChhAxBlKYvBDobAcEBVhfMTx5f3GyYHlo6bi7qFw).

For pointmaze env (config files are in folder `config/ogb_pnt_maze`):
| Env | Link | Config
| :---: | :---: | :---: |
| `pointmaze-giant-stitch-v0` | [Link](https://1drv.ms/u/c/b25b9b5879968c8a/EXgkPEtnqOBOq-Ir8e4hFZsBmFf4hXr3FlTagqpCq0oqLQ) | `og_pntM_Gi_o2d_Cd_Stgl_PadBuf_Ft64_ts512.py` |
| `pointmaze-large-stitch-v0` | [Link](https://1drv.ms/u/c/b25b9b5879968c8a/Efrwd3cuWidPv2nq2W_EfDQBLzbYFZjfuA3LGA8NqBYqTg?e=58XtKd) | `og_pntM_Lg_o2d_Cd_Stgl_PadBuf_Ft64_ts512.py` |
| `pointmaze-medium-stitch-v0` | [Link](https://1drv.ms/u/c/b25b9b5879968c8a/EUI2-KrjDYZElhKDViVSjBkBDG2avxZ03IjoqQeegSWo3Q?e=7H9XyF) | `og_pntM_Me_o2d_Cd_Stgl_PadBuf_Ft64_ts512.py` |


For antmaze env (config files are in folder `config/ogb_ant_maze`, please also download the weights of the pre-trained inverse dynamics models):
| Env | Link | Config
| :---: | :---: | :---: |
| `antmaze-giant-stitch-v0` | [Link](https://1drv.ms/u/c/b25b9b5879968c8a/EQVxZKJ__NlMrbtrQ9W9_PUBe6yOs6PWeSvT6gJs3C7Osw?e=231cfQ) / [Link(inv dyn)](https://1drv.ms/u/c/b25b9b5879968c8a/EZJrzYzOXSVLsTxgHADluNIBUXSEvCm37in5IW5fL0foqQ?e=CwVOLD) | `og_antM_Gi_o2d_Cd_Stgl_PadBuf_Ft64_ts512` |
| `antmaze-large-stitch-v0` | [Link](https://1drv.ms/u/c/b25b9b5879968c8a/EXZ4pU2cV01Fq5e-W7tAjcMBlH0BvIbneLCA5L17Rpp7dQ?e=MHGwod) / [Link(inv dyn)](https://1drv.ms/u/c/b25b9b5879968c8a/ESKNSFuqUTtAmlkjLyxCr2YBxMfd0J17PHMNwqdp5C_jKQ?e=QLNaBO) | `og_antM_Lg_o2d_Cd_Stgl_PadBuf_Ft64_ts512` |
| `antmaze-medium-stitch-v0` | [Link](https://1drv.ms/u/c/b25b9b5879968c8a/ERInZeieeOdKvWRuhQZUQa4Btb2Dbdj6ZULHK8VWz-TwWw?e=jInClo) / [Link(inv dyn)](https://1drv.ms/u/c/b25b9b5879968c8a/Ed3ElIVz3pJJq5-HqGZK6-gBniMFox109vYCieHI7UU_fg?e=8Uu6Hh) | `og_antM_Me_o2d_Cd_Stgl_PadBuf_Ft64_ts512` |


Additionally, we also provide checkpoints for high-dimenstional planner in OGBench `antmaze-large-stitch-v0` environment inside this oneDrive [folder](https://1drv.ms/f/c/b25b9b5879968c8a/EjozjTb6qOFHi2oCsxdiJNEBZGJJEBcpuBbd6p3LT-NGvg?e=gPCZ8p) (also see Table 4 of our paper).

| Env | Dim | Config
| :---: | :---: | :---: |
| `antmaze-large-stitch-v0` | 15D | `og_antM_Lg_o15d_PadBuf_Ft64_ts512_DiTd768dp16_fs4_h160_ovlp56Mdit` |
| `antmaze-large-stitch-v0` | 29D | `og_antM_Lg_o29d_DiTd1024dp12_PadBuf_Ft64_fs4_h160_ovlp56MditD512` |

<!-- | Env | Dim | Link | Config
| :---: | :---: | :---: | :---: |
| `antmaze-large-stitch-v0` | 15D | [Link](https://1drv.ms/u/c/b25b9b5879968c8a/EXZ4pU2cV01Fq5e-W7tAjcMBlH0BvIbneLCA5L17Rpp7dQ?e=MHGwod) / [Link(inv dyn)](https://1drv.ms/u/c/b25b9b5879968c8a/ESKNSFuqUTtAmlkjLyxCr2YBxMfd0J17PHMNwqdp5C_jKQ?e=QLNaBO) | `og_antM_Lg_o15d_PadBuf_Ft64_ts512_DiTd768dp16_fs4_h160_ovlp56Mdit` |
| `antmaze-large-stitch-v0` | 29D |  [Link]() / [Link(inv dyn)]() | `og_antM_Lg_o29d_DiTd1024dp12_PadBuf_Ft64_fs4_h160_ovlp56MditD512` | -->

<!-- 
| Dim | Link | Config
| :---: | :---: | :---: |
| 15D | [Link]() / [Link(inv dyn)]() | `og_antM_Lg_o15d_PadBuf_Ft64_ts512_DiTd768dp16_fs4_h160_ovlp56Mdit` |
| 29D |  [Link]() / [Link(inv dyn)]() | `og_antM_Lg_o29d_DiTd1024dp12_PadBuf_Ft64_fs4_h160_ovlp56MditD512` |
 -->


### Unzip Downloaded Files

You need to put the downloaded zip files in the root directory of this repo and unzip them, so that the created files can be in proper relative locations.
The files will be automatically put under the `logs` folder, which is organized roughly according to the following structure (some additional prefix and postfix might be added):
```
└── logs
    ├── ${environment_1}
    │   ├── diffusion
    │   │   └── ${experiment_name}
    │   │       ├── model-${iter}.pt
    │   │       └── {dataset, trainer}_config.pkl
    │   └── plans
    │       └── ${experiment_name}
    │           ├── 0
    │               ├── {experiment_time:%y%m%d-%H%M%S}
    │               ├── ...
    │
    ├── ${environment_2}
    │   └── ...
```

The `state_${iter}.pt` files contain the network weights and the `{}_config.pkl` files contain the instantation arguments for the relevant classes. 

<!-- A dummy random action dataset will also be created as a placeholder for loading. -->

<!-- 
For example,
```console
[potential-motion-plan-release]$ unzip .zip -d .
``` -->

#### Follow Generative Skill Chaining (GSC) implementation of CompDiffuser
<!-- due to difference in the task setup, -->
<!-- this GSC implementation is slightly different described in the GSC paper. -->
We extend the provided implementation of GSC for CDGS.  

You can directly perform GSC style inference, by setting
```python
args.ev_cp_infer_t_type = 'gsc'
```
in `diffuser/ogb_task/ogb_maze_v1/plan_ogb_stgl_sml.py`, then run
```console
sh ./diffuser/ogb_task/ogb_maze_v1/plan_ogb_stgl_sml.sh $1 $2 $3
```
replace `$1` by a GPU index (e.g., 0), `$2` by how many episodes to evaluate on (e.g., some number between 1 and 100), and `$3` by a seed (i.e., an integer 0).

## 🎨 Visualization
See `diffuser/utils/ogb_paper_vis_utils/` for the modified mujoco env to create multi-agent (e.g., multi-ants) env, which is used to render the figures in our paper. We might add more instructions later.

## 🏷️ License
This repository is released under the MIT license. See [LICENSE](LICENSE) for additional details.


## 🙏 Acknowledgement
* The implementation of CDGS is based on 
[CompDiffuser](https://github.com/devinluo27/comp_diffuser_release)

* We thank [OGBench]() for creating the useful evaluation benchmark.

Contact [Utkarsh A. Mishra](https://umishra.me/) if you have any questions or suggestions. We may update and add more code implementation upon request.

## 📝 Citations
If you find our work useful, please consider citing:

