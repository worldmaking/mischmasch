const systemSettings = {
  SHAPE_BOX: 0,
  SHAPE_BUTTON: 1,
  SHAPE_CYLINDER: 2,
  SHAPE_KNOB: 3,
  UI_DEFAULT_SCALE: 0.1,
  UI_DEPTH: 1/3,
  UI_NUDGE: 0.01,
  UI_SCROLL_SPEED: 1,
  UI_ROTATE_SPEED: 180,
  UI_TOUCH_DISTANCE: 0.1, // near enough to consider touch-based interaction
  UI_KNOB_ANGLE_LIMIT: Math.PI * 5./6., // 7 o'clock through 5 o'clock
  NEAR_CLIP: 0.01,
  FAR_CLIP: 20,
  vrdim: [4096, 4096],
  cableThickness: 0.001
}

export { systemSettings }