class ListItem {
  ListItem(
      {required this.question,
      required this.answer1,
      required this.answer2,
      required this.answer3,
      required this.answer4,
      required this.resultID});
  String question;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  int resultID;
  static List<ListItem> lst = [
    ListItem(
        question: 'Kết quả của phép tính 1+1=?', //1
        answer1: '1',
        answer2: '2',
        answer3: '3',
        answer4: '4',
        resultID: 2),
    ListItem(
        question: 'Tam giác đều mỗi góc bằng bao nhiêu độ?', //2
        answer1: '60',
        answer2: '120',
        answer3: '180',
        answer4: '360',
        resultID: 1),
    ListItem(
        question: 'Thứ nào sau đây không có bánh xe?', //3
        answer1: 'Xe đạp đôi',
        answer2: 'Giày patin',
        answer3: 'Ván lướt sóng',
        answer4: 'Xích lô',
        resultID: 3),
    ListItem(
        question: '1 giờ có bao nhiêu giây?', //4
        answer1: '2000',
        answer2: '3600',
        answer3: '5000',
        answer4: '5600',
        resultID: 2),
    ListItem(
        question: 'Đội tuyển vô địch WorldCup 2022', //5
        answer1: 'Bồ Đào Nha',
        answer2: 'Pháp',
        answer3: 'Argentina',
        answer4: 'Brazil',
        resultID: 3),
    ListItem(
        question:
            'Con vật nào sau đây có khả năng thay đổi màu sắc cơ thể mình cho giống với môi trường xung quanh?', //6
        answer1: 'Kiến lửa',
        answer2: 'Tắc kè',
        answer3: 'Chim cút',
        answer4: 'Cá vàng',
        resultID: 2),
    ListItem(
        question: 'Trái nghĩa với "nhút nhát" là gì?', //7
        answer1: 'E dè',
        answer2: 'Dịu dàng',
        answer3: 'Dè chừng',
        answer4: 'Mạnh bạo',
        resultID: 4),
    ListItem(
        question: 'Ngôi vị đỗ đầu trong các kỳ thi thời phong kiến là gì?', //8
        answer1: 'Thủ khoa',
        answer2: 'Bảng nhãn',
        answer3: 'Trạng nguyên',
        answer4: 'Thám hoa',
        resultID: 3),
    ListItem(
        question:
            'Đâu là một hiện tượng xảy ra khi ngủ làm cho khó thở và như có gì nặng đặt lên người?', //9
        answer1: 'Bóng đè',
        answer2: 'Bóng ma',
        answer3: 'Bóng loáng',
        answer4: 'Bóng bay',
        resultID: 1),
    ListItem(
        question:
            'Từ nào còn thiếu trong câu sau: "Thằng Bờm có cái quạt mo, phú ông xin đổi ..." gì?', //10
        answer1: 'Ao sâu cá mè',
        answer2: 'Ba bò chín trâu',
        answer3: 'Ba bè gỗ lim',
        answer4: 'Đôi chim đồi mồi',
        resultID: 2),
    ListItem(
        question: 'Thành phố nào sau đây nằm ở Tây Nguyên?', //11
        answer1: 'Pleiku',
        answer2: 'Biên Hòa',
        answer3: 'Long Xuyên',
        answer4: 'Cao lãnh',
        resultID: 1),
    ListItem(
        question: 'Loài chim nào sau đây sống chủ yếu ở New Zealand?', //12
        answer1: 'Chim hải âu',
        answer2: 'Cú mèo',
        answer3: 'Sếu đầu đỏ',
        answer4: 'Chim Kiwi',
        resultID: 4),
    ListItem(
        question: '"Gặp em trên cao lộng gió" là câu mở đầu bài hát nào?', //13
        answer1: 'Lá xanh',
        answer2: 'Lá vàng',
        answer3: 'Lá đỏ',
        answer4: 'Lá thu',
        resultID: 3),
    ListItem(
        question: 'Ai là tác giả cuốn truyện "Đảo mộng mơ"?', //14
        answer1: 'Tô Hoài',
        answer2: 'Võ Quãng',
        answer3: 'Đoàn Giỏi',
        answer4: 'Nguyễn Nhật Ánh',
        resultID: 4),
    ListItem(
        question:
            'B3 là mật danh của chiến trường nào trong cuộc kháng chiến chống Mỹ cứu nước?', //15
        answer1: 'Trị-Thiên',
        answer2: 'Tây Nguyên',
        answer3: 'Đường 9-Bắc Quảng Trị',
        answer4: 'Đông Nam Bộ ',
        resultID: 2),
    ListItem(
        question:
            'Thành viên nào của ban nhạc The Beatles đã bị ám sát vào năm 1990?', //16
        answer1: 'John Lennon',
        answer2: 'Paul Mccartney',
        answer3: 'George Harrison',
        answer4: 'Ringo Starr',
        resultID: 1),
    ListItem(
        question: 'Quốc gia nào sau đây có hơn 10.000 bãi biển?', //17
        answer1: 'Úc',
        answer2: 'Anh',
        answer3: 'Pháp',
        answer4: 'Italia',
        resultID: 1),
    ListItem(
        question:
            'Loài cây cà phê Liberica có tên gọi theo tiếng Việt là gì?', //18
        answer1: 'Cà phê chè',
        answer2: 'Cà phê mít',
        answer3: 'Cà phê vối',
        answer4: 'Cà phê chồn',
        resultID: 4),
    ListItem(
        question: 'Bệnh gì mà bác sỹ phải bó tay?', //19
        answer1: 'Gãy tay',
        answer2: 'Đau bụng',
        answer3: 'Đau mắt đỏ',
        answer4: 'Đau bụng',
        resultID: 1),
    ListItem(
        question: 'Đất nước Việt Nam có hình chữ gì?', //20
        answer1: 'O',
        answer2: 'S',
        answer3: 'V',
        answer4: 'T',
        resultID: 2),
    ListItem(
        question: 'Lịch nào dài nhất?', //21
        answer1: 'Lịch Vạn Niên',
        answer2: 'Lịch sử',
        answer3: 'Lịch treo tường',
        answer4: 'Lịch bàn',
        resultID: 2),
    ListItem(
        question: 'Đất nước Việt Nam có hình chữ gì?', //22
        answer1: 'O',
        answer2: 'S',
        answer3: 'V',
        answer4: 'T',
        resultID: 2),
    ListItem(
        question: 'Đường gì dài nhất?', //23
        answer1: 'Đường đời',
        answer2: 'Đường Trường Sơn',
        answer3: 'Đường tinh luyện',
        answer4: 'Đường vào tim em',
        resultID: 1),
    ListItem(
        question:
            'Cái gì mà đi thì nằm, đứng cũng nằm, nhưng nằm lại đứng?', //24
        answer1: 'Bàn tay',
        answer2: 'Bàn chân',
        answer3: 'Cái lưng',
        answer4: 'Cái cổ',
        resultID: 2),
    ListItem(
        question: 'Núi nào mà bị chặt ra từng khúc?', //25
        answer1: 'Hoàng Liên Sơn',
        answer2: 'Himalaya',
        answer3: 'Ngũ hành sơn',
        answer4: 'Thái Sơn',
        resultID: 4),
    ListItem(
        question: 'Ký hiệu hóa học của Sắt', //26
        answer1: 'Fe',
        answer2: 'Cu',
        answer3: 'Ag',
        answer4: 'Zn',
        resultID: 1),
    ListItem(
        question: 'Con vật nào dưới đây không thể bơi?', //27
        answer1: 'Cá sấu',
        answer2: 'Chim cánh cụt',
        answer3: 'Vịt',
        answer4: 'Voi',
        resultID: 4),
    ListItem(
        question: 'Hình thoi có mấy cạnh?', //28
        answer1: '3',
        answer2: '4',
        answer3: '5',
        answer4: '6',
        resultID: 2),
    ListItem(
        question: 'Hiệp khí đạo là tên khác của môn võ nào?', //29
        answer1: 'Aikido',
        answer2: 'Judo',
        answer3: 'Karate',
        answer4: 'Vovinam',
        resultID: 1),
    ListItem(
        question: 'Lễ hội khai ấn Đền Trần diễn ra ở tỉnh nào?', //30
        answer1: 'Ninh Bình',
        answer2: 'Bắc Ninh',
        answer3: 'Nam Định',
        answer4: 'Thái Bình',
        resultID: 3),
    ListItem(
        question:
            'Đất nước hình lục lăng là tên gọi khác của quốc gia nào?', //31
        answer1: 'Anh',
        answer2: 'Pháp',
        answer3: 'Ý',
        answer4: 'Đức',
        resultID: 2),
    ListItem(
        question: 'Thể loại thơ Haiku là của quốc gia nào?', //32
        answer1: 'Trung Quốc',
        answer2: 'Nhật Bản',
        answer3: 'Hàn Quốc',
        answer4: 'Ấn Độ',
        resultID: 2),
    ListItem(
        question: 'Tên loại búp bê gỗ nổi tiếng của Nga?', //33
        answer1: 'Daruma',
        answer2: 'Kirov',
        answer3: 'Perestroika',
        answer4: 'Matryoshka',
        resultID: 4),
    ListItem(
        question: 'Đàn cổ cầm có mấy dây?', //34
        answer1: '4 dây',
        answer2: '5 dây',
        answer3: '6 dây',
        answer4: '7 dây',
        resultID: 4),
    ListItem(
        question: 'Sông nào ngăn cách thời kỳ Đàng Trong và Đàng Ngoài?', //35
        answer1: 'Sông Gâm',
        answer2: 'Sông Tranh',
        answer3: 'Sông Gianh',
        answer4: 'Sông Đồng Nai',
        resultID: 3),
    ListItem(
        question:
            'Tác phẩm nào của nhà văn Hemingway đã đoạt giải Nobel văn học năm 1954', //36
        answer1: 'Ông già và biển cả',
        answer2: 'Giã từ vũ khí',
        answer3: 'Chuông nguyện hồn ai',
        answer4: 'Tuyết trên đỉnh Kilimanjaro',
        resultID: 1),
    ListItem(
        question:
            'Quá trình sinh tổng hợp protein diễn ra ở bộ phận nào trong tế bào?', //37
        answer1: 'Ti thể',
        answer2: 'Ribosome',
        answer3: 'Lưới nội chất',
        answer4: 'Bộ máy Golgi',
        resultID: 2),
    ListItem(
        question:
            'Tiền đạo Lê Công Vinh đã từng chơi cho đội bóng nào ở Bồ Đào Nha?', //38
        answer1: 'Gil Vicente',
        answer2: 'Rio Ave',
        answer3: 'Leixoes SC',
        answer4: 'Aves',
        resultID: 3),
    ListItem(
        question: 'Hang Sơn Đoòng được ai khám phá ra lần đầu tiên?', //39
        answer1: 'Hồ Phương',
        answer2: 'Hồ Khanh',
        answer3: 'Hồ Phì',
        answer4: 'Hồ An',
        resultID: 2),
    ListItem(
        question:
            'Thao, Nho, Phương, Định là những nhân vật trong tác phẩm nào của nhà văn Lê Minh Khuê?', //40
        answer1: 'Những ngôi sao xa xôi',
        answer2: 'Mây giăng cuối phố',
        answer3: 'Đát bỏ hoang',
        answer4: 'Tiếng lòng',
        resultID: 1),
    ListItem(
        question: 'Máy gia tốc hạt nào lớn nhất thế giới hiện nay?', //41
        answer1: 'Cyclotron',
        answer2: 'Megatron',
        answer3: 'LHC',
        answer4: 'Plasmatron',
        resultID: 3),
    ListItem(
        question: 'Bệnh gì mà bác sỹ phải bó tay?', //42
        answer1: 'Gãy tay',
        answer2: 'Đau mắt đỏ',
        answer3: 'Cúm',
        answer4: 'Đau bụng',
        resultID: 1),
    ListItem(
        question: 'Lịch nào dài nhất?', //43
        answer1: 'Lịch sử',
        answer2: 'Lịch Vạn Niên',
        answer3: 'Lịch bàn',
        answer4: 'Lịch treo tường',
        resultID: 1),
    ListItem(
        question: 'Con đường dài nhất là đường nào?', //44
        answer1: 'Đường Quốc lộ',
        answer2: 'Đường đời',
        answer3: 'Đường Trường Sơn',
        answer4: 'Đường biên giới',
        resultID: 2),
    ListItem(
        question: 'Quần rộng nhất là quần gì?', //45
        answer1: 'Quần thụng',
        answer2: 'Quần soóc',
        answer3: 'Quần đùi',
        answer4: 'Quần đảo',
        resultID: 4),
    ListItem(
        question: 'Núi nào mà bị chặt ra từng khúc?', //46
        answer1: 'Hoàng Liên Sơn',
        answer2: 'Ngũ hành sơn',
        answer3: 'Thái Sơn',
        answer4: 'Himalaya',
        resultID: 3),
    ListItem(
        question:
            'Cái gì bằng cái vung, vùng xuống ao, đào chẳng thấy, lấy chẳng được', //47
        answer1: 'Bóng mặt trăng',
        answer2: 'Cái vung',
        answer3: 'Cây cầu',
        answer4: 'Cái thuyền',
        resultID: 1),
    ListItem(
        question: 'Con gì đập thì sống, không đập thì chết', //48
        answer1: 'Con đập',
        answer2: 'Con ếch',
        answer3: 'Con sông',
        answer4: 'Con tim',
        resultID: 4),
    ListItem(
        question: 'Bỏ ngoài nướng trong, ăn ngoài bỏ trong là gì?', //49
        answer1: 'Bắp ngô',
        answer2: 'Cây mía',
        answer3: 'Củ khoai',
        answer4: 'Xúc xích',
        resultID: 1),
    ListItem(
        question:
            'Trong 1 cuộc thi chạy, nếu bạn vượt qua người thứ 2 bạn sẽ đứng thứ mấy?', //50
        answer1: '2',
        answer2: '3',
        answer3: '4',
        answer4: '1',
        resultID: 1),
    ListItem(
        question: 'Sở thú bị cháy, con gì chạy ra đầu tiên?', //51
        answer1: 'Con khỉ',
        answer2: 'Con người',
        answer3: 'Con voi',
        answer4: 'Con hổ',
        resultID: 2),
    ListItem(
        question:
            'Có bao nhiêu chữ C trong câu sau đây: "Cơm, canh, cháo gì tớ cũng thích ăn!"', //52
        answer1: '2',
        answer2: '3',
        answer3: '4',
        answer4: '1',
        resultID: 4),
    ListItem(
        question: 'Cái gì tay phải cầm được còn tay trái cầm không được?', //53
        answer1: 'Cái bút',
        answer2: 'Đôi đũa',
        answer3: 'Cái kéo',
        answer4: 'Tay trái',
        resultID: 4),
    ListItem(
        question:
            'Tìm điểm sai trong câu: ...dưới ánh nắng sương long lanh triệu cành hồng khoe sắc thắm', //54
        answer1: 'triệu cành hồng',
        answer2: 'dưới ánh nắng',
        answer3: 'sương long lanh',
        answer4: 'khoe sắc thắm',
        resultID: 4),
    ListItem(
        question: 'Tên loại búp bê gỗ nổi tiếng của Nga?', //55
        answer1: 'Makalu',
        answer2: 'Kanchenjunga',
        answer3: 'Everest',
        answer4: 'Lhotse',
        resultID: 3),
    ListItem(
        question: 'Loại nước giải khát nào chứa sắt và canxi?', //56
        answer1: 'Pepsi',
        answer2: 'Coca',
        answer3: '7up',
        answer4: 'Cafe',
        resultID: 4),
    ListItem(
        question:
            'Cái gì trong trắng ngoài xanh. Trồng đậu, trồng hành rồi thả heo vào', //57
        answer1: 'Bánh cáy',
        answer2: 'Bánh đậu xanh',
        answer3: 'Bánh chưng',
        answer4: 'Bánh mì',
        resultID: 3),
    ListItem(
        question: 'Con trai và con chim khác nhau chủ yếu ở điểm nào', //58
        answer1: 'Daruma',
        answer2: 'Cái đầu',
        answer3: 'Môi trường sống',
        answer4: 'Cái tay',
        resultID: 3),
    ListItem(
        question:
            'Khi Ronaldo thực hiện quả đá phạt đền, anh ta sẽ sút vào đâu?', //59
        answer1: 'Thủ môn',
        answer2: 'Trái bóng',
        answer3: 'Góc phải',
        answer4: 'Góc trái',
        resultID: 2),
    ListItem(
        question:
            'Con gì mang được miếng gỗ lớn nhưng không mang được hòn sỏi?', //60
        answer1: 'Con kiến',
        answer2: 'Con sông',
        answer3: 'Con cua',
        answer4: 'Con voi',
        resultID: 2),
    ListItem(
        question:
            'Có một mảnh gỗ cần cắt ra làm 50 miếng. Thời gian để cắt được 1 miếng gỗ là 1 phút. Hỏi nếu cắt liên tục không nghỉ thì bao lâu sẽ cắt xong mảnh gỗ', //61
        answer1: '49 phút',
        answer2: '48 phút',
        answer3: '51 phút',
        answer4: '50 phút',
        resultID: 1),
    ListItem(
        question: 'Làm sao để cái cân tự cân chính nó?', //62
        answer1: 'Đặt lên cái cân khác',
        answer2: 'Không thể làm được',
        answer3: 'Lật ngược cái cân lại',
        answer4: 'Đặt 2 cái cân lên bàn cân',
        resultID: 3),
    ListItem(
        question:
            'Tôi đi chu du khắp nơi trên thế giới mà tôi vẫn ở nguyên một chỗ. Vậy tôi là ai?', //63
        answer1: 'Máy bay',
        answer2: 'Cái vali',
        answer3: 'Cái tem',
        answer4: 'Con chim',
        resultID: 3),
    ListItem(
        question:
            'Hai người đào trong hai giờ thì được một cái hố. Hỏi nếu một người đào trong một giờ thì được mấy cái hố', //64
        answer1: 'Không được cái hố nào',
        answer2: 'Ba cái hố',
        answer3: 'Một cái hố',
        answer4: 'Hai cái hố',
        resultID: 3),
    ListItem(
        question:
            'Nếu chỉ có một que diêm, trong một ngày mùa đông giá rét. Bước vào căn phòng có một cây đèn, một bếp dầu và một bếp củi, bạn thắp gì trước tiên?', //65
        answer1: 'Que diêm',
        answer2: 'Cây đèn',
        answer3: 'Bếp củi',
        answer4: 'Bếp dầu',
        resultID: 1),
    ListItem(
        question: 'Con gì càng to càng nhỏ?', //66
        answer1: 'Con rùa',
        answer2: 'Con kiến',
        answer3: 'Con voi',
        answer4: 'Con cua',
        resultID: 4),
    ListItem(
        question:
            'Bạch kê là gà lông trắng, huỳnh kê là gà lông vàng. Vậy ô kê là gì?', //67
        answer1: 'Gà lông đen',
        answer2: 'Gà lông xám',
        answer3: 'Đồng ý',
        answer4: 'Gà lông nhiều màu',
        resultID: 3),
    ListItem(
        question: 'Cái gì càng kéo càng ngắn', //68
        answer1: 'Điếu thuốc lá',
        answer2: 'Cái tẩu',
        answer3: 'Cái quần',
        answer4: 'Ống hút',
        resultID: 1),
    ListItem(
        question: '30 chia 1/3 rồi cộng thêm 15 thì bằng bao nhiêu', //69
        answer1: '105',
        answer2: '75',
        answer3: '90',
        answer4: '25',
        resultID: 1),
    ListItem(
        question: 'Cái gì luôn bảo đến mà không bao giờ đến nơi', //70
        answer1: 'Ngày mai',
        answer2: 'Thất bại',
        answer3: 'Đỉnh núi',
        answer4: 'Vinh quang',
        resultID: 1),
    ListItem(
        question:
            'Một gia đình gồm bố mẹ và 6 người con trai, mỗi người con trai chỉ có một cô em gái. Hỏi gia đình đó có bao nhiêu người', //71
        answer1: '10',
        answer2: '7',
        answer3: '9',
        answer4: '8',
        resultID: 3),
    ListItem(
        question: 'Vừa bằng một thước mà bước không qua. Là cái gì?', //72
        answer1: 'Khe núi',
        answer2: 'Cái bóng',
        answer3: 'Bức tường',
        answer4: 'Sông sâu',
        resultID: 2),
    ListItem(
        question:
            'Trên hang đá, dưới hang đá, giữa là con cá thờn bơn. Là cái gì?', //73
        answer1: 'Đôi mắt',
        answer2: 'Hang động lớn',
        answer3: 'Vực sâu',
        answer4: 'Cái miệng',
        resultID: 4),
    ListItem(
        question: 'Cây gì càng trông càng thấy thấp', //74
        answer1: 'Cây cột điện',
        answer2: 'Cây cỏ',
        answer3: 'Cây nến',
        answer4: 'Cây cau',
        resultID: 3),
    ListItem(
        question:
            'Khi chưa ai biết nó thì nó vẫn là nó. Khi đã biết nó rồi thì nó không còn là nó nữa. Nó là gì?', //75
        answer1: 'Bí mật',
        answer2: 'Cuộc sống',
        answer3: 'Tình yêu',
        answer4: 'Vinh quang',
        resultID: 1),
    ListItem(
        question: 'Cá gì có bốn màu', //76
        answer1: 'Cá chọi',
        answer2: 'Cá ngựa',
        answer3: 'Cá thần tiên',
        answer4: 'Cá chép',
        resultID: 2),
    ListItem(
        question: 'Trên lông dưới lông, đêm lồng làm một. Là cái gì?', //77
        answer1: 'Đôi dép',
        answer2: 'Đôi chân',
        answer3: 'Đôi mắt',
        answer4: 'Đôi tai',
        resultID: 3),
    ListItem(
        question:
            'Một đàn chim 15 con đậu trên cây. Người thợ săn giơ súng bắn 5 phát, hỏi trên cây còn mấy con?', //78
        answer1: '15',
        answer2: '5',
        answer3: '0',
        answer4: '10',
        resultID: 3),
    ListItem(
        question: 'Vua gọi hoàng hậu bằng gì?', //79
        answer1: 'Nàng',
        answer2: 'Ái phi',
        answer3: 'Thái hậu',
        answer4: 'Miệng',
        resultID: 4),
    ListItem(
        question: 'Cái gì khi dùng thì quăng đi, không dùng lại lấy lại?', //80
        answer1: 'Cái cuốc',
        answer2: 'Cái ghế',
        answer3: 'Cái bút',
        answer4: 'Cái mỏ neo',
        resultID: 4),
    ListItem(
        question:
            'Có 2 con cua: 1 con cua đen và 1 con cua đỏ. Hỏi con nào chạy nhanh hơn?', //81
        answer1: 'Cua đen',
        answer2: 'Cua đỏ',
        answer3: 'Rỗng',
        answer4: 'Rỗng',
        resultID: 1),
    ListItem(
        question: 'Cái gì chứa nhiều nước nhất mà ko ướt tí ti nào?', //82
        answer1: 'Bình nước',
        answer2: 'Thùng phuy',
        answer3: 'Quả dừa',
        answer4: 'Bản đồ',
        resultID: 4),
    ListItem(
        question: 'Người da trắng tắm biển đen thì họ sẽ bị gì?', //83
        answer1: 'Bị đen',
        answer2: 'Bị nổi',
        answer3: 'Bị ướt',
        answer4: 'Bị chìm',
        resultID: 1),
    ListItem(
        question:
            'Con gì đi ngồi, đứng ngồi, nằm ngồi, ngủ cũng ngồi luôn là con gì?', //84
        answer1: 'Con chuột',
        answer2: 'Con ếch',
        answer3: 'Con thỏ',
        answer4: 'Con gà',
        resultID: 2),
    ListItem(
        question:
            'Có ba quả táo trên bàn và bạn lấy đi hai quả. Hỏi bạn còn bao nhiêu quả táo?', //85
        answer1: '0 quả',
        answer2: '1 quả',
        answer3: '2 quả',
        answer4: '3 quả',
        resultID: 3),
    ListItem(
        question:
            'Có 2 người bạn 1 mù, 1 câm đi shopping. Câm mua cái nón thì lấy tay chỉ lên đầu và gõ gõ mấy cái còn Mù muốn mua kem đánh răng thì làm sao?', //86
        answer1: 'Làm động tác đánh răng',
        answer2: 'Chỉ vào hộp kem đánh răng',
        answer3: 'Nói: Tôi muốn mua kem đánh răng',
        answer4: 'Rỗng',
        resultID: 3),
    ListItem(
        question: 'Bạn làm việc gì đầu tiên mỗi buổi sáng?', //87
        answer1: 'Rửa mặt',
        answer2: 'Đánh răng',
        answer3: 'Nghe đài',
        answer4: 'Thức dậy',
        resultID: 4),
    ListItem(
        question:
            'Tôi có 4 cái chân, 1 cái lưng, nhưng không có cơ thể. Tôi là ai?', //88
        answer1: 'Con ngựa',
        answer2: 'Cái bàn',
        answer3: 'Con rùa',
        answer4: 'Cái ghế',
        resultID: 4),
    ListItem(
        question:
            'Cây nến đốt càng nhiều càng ngắn. Cây gì đốt càng nhiều càng dài?', //89
        answer1: 'Không có cây đó',
        answer2: 'Cây hương (nhang)',
        answer3: 'Cây tre',
        answer4: 'Cây chuối',
        resultID: 3),
    ListItem(
        question: 'Làm thế nào để có gà chín cựa', //90
        answer1: 'Luộc nguyên con gà',
        answer2: 'Phối giống gà mới',
        answer3: 'Lắp thêm cựa giả',
        answer4: 'Rỗng',
        resultID: 1),
    ListItem(
        question:
            'Một kẻ giết người bị kết án tử hình. Hắn ta phải chọn một trong ba căn phòng: Phòng thứ nhất lửa cháy dữ dội, Phòng thứ hai đầy những kẻ ám sát đang giương súng, và phòng thứ ba đầy sư tử nhịn đói trong ba năm. Phòng nào an toàn nhất cho hắn?', //91
        answer1: '3',
        answer2: '2',
        answer3: '1',
        answer4: 'Rỗng',
        resultID: 1),
    ListItem(
        question:
            '2 con vịt đi trước 2 con vịt, 2 con vịt đi sau 2 con vịt, 2 con vịt đi giữa 2 con vịt. Hỏi có mấy con vịt?', //92
        answer1: '3',
        answer2: '2',
        answer3: '4',
        answer4: '1',
        resultID: 3),
    ListItem(
        question:
            'Có 1 bà kia không biết bơi, xuống nước là bà chết. Một hôm bà đi tàu, bỗng nhiên tàu chìm, nhưng bà không chết.Tại sao (không ai cứu hết)?', //93
        answer1: 'Bà có áo phao',
        answer2: 'Bà biết lặn',
        answer3: 'Bà đi tàu ngầm',
        answer4: 'Bà đi điều dưỡng',
        resultID: 3),
    ListItem(
        question:
            'Có 1 anh chàng làm việc trong 1 tòa nhà 50 tầng, nhưng anh ta lại chỉ đi thang máy lên đến tầng 35 rồi đoạn còn lại anh ta đi thang bộ.Tại sao anh ta lại làm như vậy ?', //94
        answer1: 'Anh ta sợ độ cao',
        answer2: 'Thang máy không lên được tầng 50',
        answer3: 'Anh ta bị điên',
        answer4: 'Thang máy hỏng',
        resultID: 2),
    ListItem(
        question:
            'Câu chữ nào mà những người vui sướng khi nhìn thấy nó sẽ trở nên buồn bã và ngược lại, những người buồn bã u sầu khi thấy nó sẽ trở nên vui vẻ hơn.', //95
        answer1: 'Tháng này được thưởng thêm rồi!',
        answer2: 'Yên tâm đi mai có lương rồi',
        answer3: 'Điều đó rồi cũg qua đi.',
        answer4: 'Nhà giả kim',
        resultID: 3),
    ListItem(
        question:
            'Bên trái đường có một căn nhà xanh, bên phải đường có một căn nhà đỏ. Vậy, nhà Trắng ở đâu ?', //96
        answer1: 'Ở Mỹ',
        answer2: 'Ở phía sau',
        answer3: 'Ở trên trời!',
        answer4: 'Ở bên trên tầng lầu',
        resultID: 1),
    ListItem(
        question: 'Tại sao con chó không cắn được đuôi của mình?', //97
        answer1: 'Vì cổ nó quá ngắn',
        answer2: 'Vì nó chưa học Yoga',
        answer3: 'Vì đuôi nó không đủ dài',
        answer4: 'Vì chân nó quá ngắn',
        resultID: 3),
    ListItem(
        question: 'Bà đó bả chết bả bay lên trời.Hỏi tại sao bà ấy chết?', //98
        answer1: 'Bò đá bả chết',
        answer2: 'Bà nhảy lầu tự tử',
        answer3: 'Bà thất tình',
        answer4: 'Bồ đá bả té',
        resultID: 1),
    ListItem(
        question:
            'Bà đó bả chết bả bay lên trời.Hỏi bà ấy chết năm bao nhiêu tuổi?', //99
        answer1: '37',
        answer2: '87',
        answer3: '93',
        answer4: '73',
        resultID: 4),
    ListItem(
        question:
            'Có 1 đàn chim đậu trên cành, người thợ săn bắn cái rằm. Hỏi chết mấy con?', //100
        answer1: '1',
        answer2: 'Không chết con nào',
        answer3: '5',
        answer4: '15',
        resultID: 4),
    ListItem(
        question:
            '2 con vịt đi trước 2 con vịt, 2 con vịt đi sau 2 con vịt, 2 con vịt đi giữa 2 con vịt. Hỏi có mấy con vịt?', //101
        answer1: '3',
        answer2: '2',
        answer3: '4',
        answer4: '1',
        resultID: 3),
  ];
}
