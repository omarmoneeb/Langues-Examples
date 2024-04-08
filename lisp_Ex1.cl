;; Set the menu with items, their prices, and available stock.
(setq menu '((pizza 10 10)
             (burger 15 8)
             (salad 8 15)
             (pasta 18 12)
             (water 5 20)
             (soda 2 40)))

;; Function to retrieve the price of an item given its name and the menu.
(defun get_price (item menu)
  (cond ((null menu) nil)  ;If the menu is empty, return nil.
        ((equal item (car (car menu)))
	 (cadr (car menu)))  ;If item matches, return its price.
        (t (get_price item (cdr menu))))) ;Otherwise, recur with the rest of the menu.


;; Function to check if an item is present in the menu.
(defun is_member (item menu)
  (cond ((null menu) nil) ; If the menu is empty, the item is not present.
        ((equal item (car (car menu))) t) ; If item matches, return true.
        (t (is_member item (cdr menu))))) ;Otherwise, recur with the rest of the menu.


;; Function to get the stock level for an item given its name and the menu.
(defun get_stock (item menu)
  (cond ((null menu) nil) ; If the menu is empty, return nil.
        ((equal item (car (car menu)))
	 (caddr (car menu))); If item matches, return its stock.
        (t (get_stock item (cdr menu)))));Otherwise, recur with the rest of the menu.

;; Function to display the menu items with their prices and stock levels.
(defun menu-view (menu)
  (format t "Item  Price  Stock~%"); Print the column headers.
  (do ((m menu (cdr m))); Iterate over the menu list.
      ((null m)) ; Stop when the end of the menu list is reached.
    (let ((item (car (car m)))
          (price (cadr (car m)))
          (stock (caddr (car m))))
      (format t "~a  ~a  ~a~%" item price stock)))) ; Print item details.

;; Function to sum up the total price given an item, its quantity, the current accumulator, and the menu.
(defun sum (item quant acc menu)
  (let ((price (get_price item menu)))
    (+ acc (* quant price)))) ;Add to the accumulator the product of quantity and item's price.


;; Function to update the stock for an item in the menu.
(defun update-stock (item new-stock menu)
  (cond ((null menu) nil) ; If the menu is empty, do nothing.
        ((equal item (car (car menu))) ; Update the item's stock.
         (cons (list (car (car menu)) (cadr (car menu)) new-stock) (cdr menu)))
        (t (cons (car menu) (update-stock item new-stock (cdr menu)))))); Otherwise, recur with the rest of the menu.


;; Custom max function to find the maximum of two numbers.
(defun my-max(a b)
  (if (> a b)
    a
    b))
;; Function to take orders from the user, updating the total and the menu stock as orders are placed.

(defun take-order (acc menu)
  (menu-view menu) ; Display the menu.
  (format t "Choose what you want. Enter the item then the Quantity: ") ; Prompt for an order.

  (let* ((item (read)); Read the item name.
         (quant (read)); Read the quantity.
         (stock (get_stock item menu)) ; Get the item's stock.
         (new-stock (- stock quant))) ; Calculate the new stock.
    (let* ((updated-menu (update-stock item (my-max new-stock 0) menu))
	   ; Update the menu with the new stock.
           (new-acc (cond ((and (is_member item menu) (>= stock quant))
                           (format t "Order added: ~a x ~a~%" item quant)
                           (sum item quant acc menu))
			  ; Add to the total if stock suffices.
                          ((is_member item menu)
                           (format t "Sorry, we don't have that much. We will adjust it to what we have: ~a.~%" stock)
                           (sum item stock acc menu))
			  ; Adjust the order to available stock.
                          (t
                           (format t "Item not found.~%") ; Item not found.
                           acc)))); Keep the accumulator unchanged.
      (format t "Your current total is: $~a~%" new-acc) ; Display the current total.
      (format t "Do you want to order more? (yes/no): ")
      ; Ask if the user wants to continue.
      (let ((answer (read)))
        (cond ((equal answer 'yes) (take-order new-acc updated-menu))
	      ; If yes, recur with the updated total and menu.
              (t (format t "Final total for your order: $~a~%" new-acc)))))))
; If no, display the final total.

(defun start()
  (format t "Welcome to our humble resturant, Here is the menu: ~%")
  (take-order 0 menu))
