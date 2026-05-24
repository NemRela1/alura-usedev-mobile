import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/app_components.dart';

class ProductSection extends StatefulWidget {
  const ProductSection({
    super.key,
    required this.title,
    required this.img,
    required this.description,
    required this.price,
    this.options,
    this.others,
  });

  final String title;
  final String img;
  final String price;
  final String description;
  final Map<String, dynamic>? options;
  final Map<String, dynamic>? others;

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  String? _selectedOption;
  String _selectedQuantity = '1';
  String? _selectedOther;

  @override
  void initState() {
    super.initState();

    if (widget.options != null && widget.options!['choices'] != null) {
      final choices = widget.options!['choices'] as List<dynamic>;
      if (choices.isNotEmpty) {
        _selectedOption = choices[0].toString();
      }
    }

    if (widget.others != null && widget.others!.isNotEmpty) {
      final firstKey = widget.others!.keys.first;
      final choices = widget.others![firstKey] as List<dynamic>;
      if (choices.isNotEmpty) {
        _selectedOther = choices[0].toString();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20, bottom: 10),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_back_ios_sharp, size: 20),
                  const SizedBox(width: 16),
                  const Text(
                    "Detalhes do Produto",
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(widget.img, fit: BoxFit.contain),
          ),
          const SizedBox(height: 10),
          Text(
            widget.title,
            style: GoogleFonts.orbitron(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 10,
            alignment: WrapAlignment.start,
            children: [
              SvgPicture.asset('assets/images/compartilhar.svg'),
              SvgPicture.asset('assets/images/favoritar.svg'),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            widget.description,
            style: GoogleFonts.poppins(fontSize: 20),
          ),
          const SizedBox(height: 15),
          Text(
            "R\$ ${widget.price}",
            style: GoogleFonts.poppins(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          if (widget.options != null) ...[
            const SizedBox(height: 25),
            Text(
              widget.options!['optionsLabel'] ?? 'Escolha uma opção',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: (widget.options!['choices'] as List<dynamic>).map((choice) {
                final choiceString = choice.toString();
                return Row(
                  children: [
                    Radio<String>(
                      value: choiceString,
                      groupValue: _selectedOption,
                      activeColor: Colors.black,
                      fillColor: WidgetStateProperty.all(Colors.black),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    Text(
                      choiceString,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
          const SizedBox(height: 10),
          CustomSelect(
            label: "Quantidade",
            items: List.generate(10, (index) => (index + 1).toString()),
            value: _selectedQuantity,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedQuantity = value;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          if (widget.others != null && widget.others!.isNotEmpty)
            CustomSelect(
              label: widget.others!.keys.first,
              items: (widget.others!.values.first as List)
                  .map((e) => e.toString())
                  .toList(),
              value: _selectedOther,
              onChanged: (value) {
                setState(() {
                  _selectedOther = value;
                });
              },
            ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Produto adicionado ao carrinho!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                overlayColor: const Color(0xFF430091),
                backgroundColor: const Color(0xFF780BF7),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/add_shopping_cart.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    "Adicionar ao carrinho",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
