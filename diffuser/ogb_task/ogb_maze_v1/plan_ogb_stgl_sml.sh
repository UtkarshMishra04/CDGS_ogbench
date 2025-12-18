#!/bin/bash

#SBATCH --job-name=ogb_scene
#SBATCH --output=logs/ogb_scene_%j.out
#SBATCH --error=logs/ogb_scene_%j.err
#SBATCH --nodes=1
#SBATCH --time=10:00:00
#SBATCH --qos=inferno
#SBATCH --gres=gpu:v100:1
#SBATCH --account=gts-dxu345-rl2

echo $(hostname)

source ~/.bashrc
source .venv/bin/activate

# config=""

# config="config/og_antM_Gi_o2d_luotest.py" ## test only, placeholder config file


## --------- Planning: OGBench AntMaze Stitch 15/29D Planner ----------
## i.e., the diffusion planner generates trajectory of shape (Horizon, 15/29)
# config="config/ogb_ant_maze/og_antM_Lg_o15d_PadBuf_Ft64_ts512_DiTd768dp16_fs4_h160_ovlp56Mdit.py"
# config="config/ogb_ant_maze/og_antM_Lg_o29d_DiTd1024dp12_PadBuf_Ft64_fs4_h160_ovlp56MditD512.py"


## --------- Planning: OGBench AntMaze Stitch 2D Planner ----------
## Giant
# config="config/ogb_ant_maze/og_antM_Gi_o2d_Cd_Stgl_PadBuf_Ft64_ts512.py"
## Large
# config="config/ogb_ant_maze/og_antM_Lg_o2d_Cd_Stgl_PadBuf_Ft64_ts512.py"
## Medium
# config="config/ogb_ant_maze/og_antM_Me_o2d_Cd_Stgl_PadBuf_Ft64_ts512.py"

## --------- Planning: OGBench AntMaze Explore 2D Planner ----------
## TODO:


## --------- Planning: OGBench PointMaze Stitch 2D Planner ----------
## Giant
config="config/ogb_pnt_maze/og_pntM_Gi_o2d_Cd_Stgl_PadBuf_Ft64_ts512.py"
## Large
# config="config/ogb_pnt_maze/og_pntM_Lg_o2d_Cd_Stgl_PadBuf_Ft64_ts512.py"
## Medium
# config="config/ogb_pnt_maze/og_pntM_Me_o2d_Cd_Stgl_PadBuf_Ft64_ts512.py"




{

PYTHONDONTWRITEBYTECODE=1 \
CUDA_VISIBLE_DEVICES=${1:-0} \
MUJOCO_EGL_DEVICE_ID=${1:-0} \
python diffuser/ogb_task/ogb_maze_v1/plan_ogb_stgl_sml.py \
    --config $config \
    --plan_n_ep $2 \
    --pl_seeds ${3:--1} \


exit 0

}