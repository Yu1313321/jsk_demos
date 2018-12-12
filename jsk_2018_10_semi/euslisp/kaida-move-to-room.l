(defun go-room-A nil
  (setq room73A3_door_front (send (send *eng2-scene* :spot "/eng2/7f/room73A3-front") :copy-worldcoords))
  (setq room73A3_door_front_offset (send room73A3_door_front :transform (make-coords :pos #f(-300 -300 0) :rpy (float-vector 0 0 0))))
  (send *fetch* :move-to room73A3_door_front_offset :world)
  (send *ri* :move-to room73A3_door_front_offset)
  (send *ri* :wait-interpolation)
)

(defun go-room-B nil
  (setq room73B2_table_side (send (send *eng2-scene* :spot "/eng2/7f/room73B2-table-side1") :copy-worldcoords))
  (setq room73B2_table_side_offset (send room73B2_table_side :transform (make-coords :pos #f(-500 0 0) :rpy (float-vector 0 0 0))))
  (send *fetch* :move-to room73B2_table_side_offset :world)
  (send *ri* :move-to room73B2_table_side_offset)
  (send *ri* :wait-interpolation)
)
(defun go-room-C nil)


(defun kaida-move-to-room nil
  (setq number_red (ros::get-param "/box_number/red"))
  (setq number_green (ros::get-param "/box_number/green")) 
  (setq number_blue (ros::get-param "/box_number/blue"))
  (if (and (/= number_red 0.0) (/= number_green 0.0) (/= number_blue 0.0))
      (if (> number_red number_green)
          (if (> number_red number_blue)
              (go-room-A)
              (go-room-B))
          (if (> number_green number_blue)
              (go-room-C)
              (go-room-B)
          )
      )
  )
)
