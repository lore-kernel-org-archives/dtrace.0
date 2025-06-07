Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D36E258CC8
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276910; cv=fail; b=NsIb/9ie8+jzL42rCH87qYMqOJgEFkHj30P7x6ULoT8gho640Wa8vAyCRzxtgn0EP73vFRkBEKZcs2LqLnaV6qhzrxZTzC0TNC+BvGgynCz6Fd/mN0ChZ3o74DDmuifEBFq13xFxwWELHNlS/P/kd+udz/Xcz4wpSoOnG9qQpaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276910; c=relaxed/simple;
	bh=9AXw3COaxU97Oj75SRy7NNRwQdNvU7ZCsGVd+8AdTdg=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=byzfgekWMC+hpII/A7Q1Aw1+RsTqibYAml1vS5rNRs1ebl5ZOEal0wRabEBd0j5T/RYcRB20q09+Rm/lB2EjXhWdnyQzOkrla77hsk/QTx78w4J4uVaKUCWIOUU5al5gO9e6b33y7vExYROGHElIkMvErmBD+0t2p3sqGNEy5no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aBlgggRN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YnUup+XI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aBlgggRN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YnUup+XI"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5574v19X009839
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=C1q9XDDj9+9Gs0QcYiMeY7jDcEJofizXnHKWZEeh9xM=; b=
	aBlgggRNf7opTMTSb5uYFXGiB0D+dsmgtNJZzxeqsQeDj5Xri7oFV7pR4P4P56E5
	p7OyX2EnMK7wWK4UxPgGDBpggtUl5MyfDTNSy/jrsxZ5fFeNxhrZIVYjoTDFjLRi
	l2pad+JRDoBpKXmX5BRh0ZnBYFjU9T1LxQ20BcTmC6xyrL7YkFsePzdXtAIZuz03
	LVrtMg4Y9cjpkCcbVA5O3WH84D6O80nEnZj91oAUpAJlsNXbJx9lE/VuR19JVger
	DK/t599Rk4DT6tsyg4aQy2+BA2uq7qBZLUlywsbdUKUC4jegcg2O5Mu86vqsk7N4
	TjA0HyyVL6T1pUE8zgrA0Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dywr1p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55765vNP003191
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:06 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv5uyqr-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfEnChYFKVavwpjjIa8AiI/yzkxYvlIOQ+AzPfIwzBEnPiBnc1IaJyINR5zNCy9nQNb0/DaUGkZBkwHQ5yKRVB7AVH4pA6aWkU3IXu6AShDZnNY0itGFNU7WERssp4PTBnQgNnU/E9kWT/WetmKgTVtYo7AlYjKXdModqAs545hF1BBs4NyDJ05NVpNJfFnjjlJUlEtVfzt20TtkzuAvSeObKi/CMY4kxdBMTdxOwpZt38uzIAf58YWiHlUU8bOjNE7MTXw57b+YQiRvxhtLvGFhpA8GcRmDL6/CsBcmEDgDFJltlVCht0FTI6N3d5bFlRgsGwWcvjZ0gnn3TpofDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1q9XDDj9+9Gs0QcYiMeY7jDcEJofizXnHKWZEeh9xM=;
 b=j/xNUc9YdfRTupc5MZrvqWivP1ik4A8yLhhPf8UAYsu7OFNgQNVrH7BtJqk8Of+VhYn/8ns8lEo6pJ+cAEAnPyf5xRF5Sp8cpoGt+rad0b+WamQLF0IKH9xKq5s86z1h7CX0D9YkhoXqgUXwEUakrwEnHiBOLdJLlSAkInBx7OH7uUGdnVewhaj5GTHrzgKOo0meiWu5NHGMR0ZgJ1IKdoCpJShrlgBnBVrjMZKsD+7h9rQbsWWZtWuCWC0zdmNUUbmpXSl6NkKuAsAhlkWT+yjDhHbzi/dQXTWkGYjg2CRU7EnBq8L82TI5jIBJqx/vRhnCJqMv/fmJsdc4+D0cTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1q9XDDj9+9Gs0QcYiMeY7jDcEJofizXnHKWZEeh9xM=;
 b=YnUup+XImhOUM3SQOa6Jbpe4tFwSHCzk1aF64iAsrP7JGkEez8JewMmiDYfORiy5pvCmLA1dg7FYuMDxEGtkecQHTLdmr3gjAkwBLhQJ7i7rHgfVcttY/cZqd3JxM/tCQChltlTmYUr5XQqhJEL5UAUY5F+g06TEg9AkGCfNF0A=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:15:04 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:15:04 +0000
Date: Sat, 07 Jun 2025 02:15:04 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 12/17] usdt: add HASUSDT to the helper ioctl interface
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB837461A3243A04EEB4FC0780C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 653b4493-e00f-45e6-96f4-08dda58aa4d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b7FNyw8xWTMcAVr2b6n0aAbIOBhCzl/3oAuE6DT0J8QsNWnvUkcpP9zXAUQi?=
 =?us-ascii?Q?CbtHge5TfzAMqOQbewJEMYRq2z/qqskMsWzStyjD28OHI4k3F0E8jEuhQvWS?=
 =?us-ascii?Q?2OimX7p5+xJxMc7dGP0DXE+CDqnMwoUPmZcnhhqFgC8rsJudzpgA6kC+e0P+?=
 =?us-ascii?Q?c8wM7sWl7ZS0X7rq+s+2+Jm/X/1QSLwIBEzM7x811dJqVwI2iladjx/U8wPI?=
 =?us-ascii?Q?6Pei+7MdrRoBwC0cYMuqEQ+RylVG+1NR6WuJj6t9+00Ue+Sb5ava+VENcIjg?=
 =?us-ascii?Q?AvPz7qk42SidP0CExU3Mumxuo7Uv3V/Ha+BxTGUiggtvzjAyN0YEe8P22bbH?=
 =?us-ascii?Q?bi/jEA6YygmUR5vXfEHOUSHayTekLrbtXUvMb2xmhZyvQ2293ioacRVr/thS?=
 =?us-ascii?Q?+6Dtt753QqLUbsnMBAbO48wc+eStY5uQhqooO7Tfti2UA/Pj3XxuEWk/bM6E?=
 =?us-ascii?Q?gc4NmbrXKvRdP6KNgcJTEMSWYfHdr8PT7SEhc1iC/KqUknq72Fg2Fd085WB1?=
 =?us-ascii?Q?uZxyVG6HkZ/oBalflMYhVuL6YSWXLroNroGHcDj4hHEX26OM34IdQFAMFNOy?=
 =?us-ascii?Q?xmB0ajGm0JiKRK6Z8q9kfJAVwNtS+50UN4N7VPKFr66krFXbX+3zs04IBipR?=
 =?us-ascii?Q?cz9Zr7FvP7jUnopw/p8lSKaingOOwQrAYm4upbWtGqVihSfAI7EmdDtQjaSz?=
 =?us-ascii?Q?aJ9kiHB68roLBthiUyY5PiQPOYYIyrJdUdLWvQ3tldX5QwkQGCqm2Gk71zAh?=
 =?us-ascii?Q?5CQiIRTp4dd8F3Uf0qNdVkad9FxyEDPNAKh4jUCcI9OrklrZW80rI6VwYu0M?=
 =?us-ascii?Q?sSRlK/8zAO0hL1oUyiu4fFpe5epQxd0fLupJN8YYsNNEBkxSQinopW5QCftA?=
 =?us-ascii?Q?0l6wVT9zPQrId7srkNtqN6+MAxxx0/mk+Lf22mdVI0FGkHhD2rx8w+UW+bJx?=
 =?us-ascii?Q?skhoypGQuGQqcbFo63tsMvLXNWAxVXdPp/FrhSJVckaAHD0xxsko9+yM9ykZ?=
 =?us-ascii?Q?kPn50auGCtTfi6XTHnVCBahxGs+g+a2O49rmm/PEjZFTG4Jx6cDiVpesd2fu?=
 =?us-ascii?Q?Tb1OG8bYuXjUF53n/QsGuTP0cB9QzaOZ3UrZorNy9cZks4Hz6jxNr4lt5afy?=
 =?us-ascii?Q?1YKL5gtB4erH9DrPRSB3hivsBBY4rl4Qs500mTddZ4ruLS5UAydhugyOtf8v?=
 =?us-ascii?Q?j2F+HDa1YsI4U+avpmL2ZscuHyOQqEDFrn3z1DkD+Ex49lhR49YhDR1H4lPf?=
 =?us-ascii?Q?tAcBH8P39UilFfN9l5OR3F0FuiVaYe1ZiCQMt1SB+OEaz/Msh1DdswGvGnQ6?=
 =?us-ascii?Q?2INsNtZRWyFgUHWw0oQNiqw7W7OEMrafbmaa0Q3cnuxwnC1FFPMRYY1JAu5T?=
 =?us-ascii?Q?LiyqvJcAWP/l5zzrptzBT00j/06AH//HjcVEzp949sxjce3BmwUpfD5ZjIaq?=
 =?us-ascii?Q?/sOmB+nijoQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9hm6n4mUNctRZmL5etO+jZepebtqY7aBteDq0rqyWZ4DMiOEWWB1+VSH17So?=
 =?us-ascii?Q?6JrPXK889eEWG4Yn2xu/4bzYKLqRB8Ip6DBP1L87f1lwrGdBFFbmzbFfOYH6?=
 =?us-ascii?Q?sKDv6d1v4GVz0nEG2BQJCBbjkHeUtpwswrhxNeyrM9gRsGFWk7Uhlt8m99W+?=
 =?us-ascii?Q?E3GxIS4HGa7p0ua3J0w9lCF//x5/6Tlk9jlw4pJB/4ULCe4HwpUDFSQ3jHQn?=
 =?us-ascii?Q?6x7YRoTz8Ol65I/4m6eyiz/w/+v/mVrqEMdGksYYYly7yPgBRP1NvnLbZUYl?=
 =?us-ascii?Q?GJQnAjXlQHJ2PS140F00+uBXX+lRIiSq1CXw5o5pvRXj2cl1ebFAS+y5wXsa?=
 =?us-ascii?Q?rxqHN9Nil1QBx03jFg8pUrZFELB/KjtkXTk65gh1/goBpn8D2gRbqOiYbTo1?=
 =?us-ascii?Q?gHRIUxxFI8OWLjcr+pw6de8cp/RJkbGTUSWGt1OUv1tLjmGkQyqDe/Nl3FZo?=
 =?us-ascii?Q?kv94Re6fQcJ2Yfg52B9HdxcRnAOoTrVWxIeRb0XQ0LD/YqWWwMOfbx3QIjCa?=
 =?us-ascii?Q?dg/ewtvHlsaMnwHX/gwhRFhmginq4R2hRBQF8j+/dXxZhxN26INgUiTgdnOP?=
 =?us-ascii?Q?p3CgqudvBrhP5aCGKHSjRZonwgivcvOMjQpRGZnmTg2aNJ2pFbTXac2Iy3UX?=
 =?us-ascii?Q?JotG9+4kee/TGdYyopnKhlZWibh43/ShiEV7fvqPTx792Pfk32HsikJDQW8I?=
 =?us-ascii?Q?EhPsZ9X/k3vbo/UxtDYYuhdT+KInlO8B3DxTu09s5j0WxRuGCNXlu5xfdc/q?=
 =?us-ascii?Q?NWHyTF7MvJPXpaY3lSmulUSBBXzH2vtpCffVkVOLc6gNYNsWixHyqFwvPBqX?=
 =?us-ascii?Q?qVVKoyeDF3IxfBgnVPv6fxmXe30M30wR630auBSkwlOLYkhqd7/CpCfV14gQ?=
 =?us-ascii?Q?udDWFJ2F9Az/YyCW7po+Yye62h0IJFPFwZHoajS8TgX4ihDrCBPo6s8IEFIm?=
 =?us-ascii?Q?4MI93CR/b8ZKJtCaCfjPJ8tIfncuMF1cyzlZfRKq9myfNNsgVffF0cDeVkIF?=
 =?us-ascii?Q?815Tj9r57nydobOjCULzU4Cd+0y9SbBj7Tj81xeHKeYh+N7FlLGVeChrnkBz?=
 =?us-ascii?Q?k+mLYOnd2C9F1LHSH2xN1MDD6megkgagbozDsRwEZ86+VrP29VjQcrc5ncm0?=
 =?us-ascii?Q?p8jy4gKw4PvZtvnQd2hyPuiTchL3WCq2jh18rg6UITnIsT9ZgUVAcyD0CbG5?=
 =?us-ascii?Q?zbJ5SEB7cOad9JW7KhTeRKQGZ9K01gxnHgj44Pqc/dB7jh2EellBU1d3Uosw?=
 =?us-ascii?Q?jrlvFY4UxnHj7kjPnF3TvooIXMxWoygmekY40xxLJuCg5RHcVAmhRhG6Rjzy?=
 =?us-ascii?Q?Z/L2nCu20qq4E8b5WilaF2Xq3dA9s8l2WvBqDdeBweFNwiJHr5ipqOh/bktv?=
 =?us-ascii?Q?HGPcuRLhuTYxEZ+Z77cN3y7AH06c99ojXJfcwZYJSA1ySrBudzHxNEEO1LcC?=
 =?us-ascii?Q?hg7YMkFzoIpR8ZqiV5R2m3kLrDiZ2P8787/BQ7CbHa6XQRNSE7o7vVSusw2V?=
 =?us-ascii?Q?0hjUwjkoM8a6EsIIKme3Gv9o8dFw61m3nW4+nfOhK3RhTMJ68C4RxevnstUx?=
 =?us-ascii?Q?xUrT6HYD83ojwKyqtsPIIZER4nXFkNZ6vSRhOyTyEWmNFBZMGKGlRGwuZw8L?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E7VMS8IOTl9O037E6OM/xDX5DiecgzmtV+2xQZWVXiWqjcyws0xa1yyDQcqB3eMhCK/xNK2+QnDba5sKmQQlNtyH/SWqU0R8ZNIrqJFl68jJG3cOnAPcGDAPmcvKlhE3mtIdFjCo/3+Ka2E+fUfyLv6Q52ZJsDHK69A01+Y4Bya3xQQnUMndVqfkgzMBzsHlpxvgzNqBdKdNQuy1hEB1HULPuDDUiDT8SdjLQwabJzByjP8Ou/WUhhtDhXoF74hf0bUJmsPnkd6e6kaJsTTN0wlzIgA9w22ip/ZUvkyPLDo1UuK9lYi7uZASQtAkgwCTBZhzNZsCv/dbopIGvUDKI9qBWcZo9ObYWQHMM/DwGXwyluEXWslCGB6fvGxHO7J0ojHad4d1Atiy346nIqelVZb/V02zW0lIMzi8K3kR/wdbzd3UYSmYpuIXo5XLVRdY58DbwL4pi5V2iZGJBGGzJpUC++pNKiZHtHumQyR4Ta41oJExD970aQQvYqUOqDAfdccS7gxwXwBPO1/9nc9lKkFsAejul+JcfcmSnhMLc8dbK3KI8R19d7jYiOsUsLqj9Qd+fEdpw0c/4Y3df/MEtSgHHYbZzCUfSocFWVwM2xo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653b4493-e00f-45e6-96f4-08dda58aa4d3
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:15:04.6548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mK5yeFtrMqKYsTliP0sHlVJl7w398DAzgF8dCh0C5s7nE8Dwc2NN5naSjHoDFE/c1qgWbUWhz/VmyY9WnvFuskKvzBaZHaU+/fiUoVyKZIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=6843d8eb b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=8BYCmc0dCO9CqidnpmwA:9 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: VH0jFMVOetxHHmFHpF37bZhRyc5pwUK6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfXzz6s1WePJoWJ JDL473HVi4WszmY18iNBhnjIKqnmW3JPf90AiOARUJ7wQ8n4dS7YQTECHjmuC5zffG6yFhqZOMo ics1iBOMIf2cHt26QeG3JRqzFN2lUTETBURTEakjeNKuDf6M5BkidVIU6+yPabsgrSKVJrwznIq
 mUrkTAMQ1iM0j/7SEwadhKXd9cZDWiAWnnBpQhNo8tjRfPG257hy5VklDTBcmr9jZxD8N7xB8Qz en/43yBkWhbRi7Kj3aWkCGRLE2hBnzIWkupaPKCDAeItyJgsfo8uaA6CgGRWN825FcWzWdntanI 6KWFp941ahz4Pq345Io33t7YDg/cxrHopKFjAN+JSGAvwI9ZE5/8usj7jGfRH6qpYCe1wgwRkNU
 EEkKdtahyFMaUCrUyyj1nPTeKYP+DYH2o8K9jrMYZuCEvYIwliVvf9jf5pWzTatoV8lKvXZ2
X-Proofpoint-GUID: VH0jFMVOetxHHmFHpF37bZhRyc5pwUK6

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 include/dtrace/ioctl.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dtrace/ioctl.h b/include/dtrace/ioctl.h
index 2273453a..9ecdc385 100644
--- a/include/dtrace/ioctl.h
+++ b/include/dtrace/ioctl.h
@@ -2,7 +2,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
- * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2025, Oracle and/or its affiliates. All rights reserved.
  */
 
 #ifndef _DTRACE_IOCTL_H_
@@ -15,5 +15,6 @@
 #define DTRACEHIOC_ADD		_IOW(DTRACEHIOC, 1, dof_hdr_t)
 #define DTRACEHIOC_REMOVE	_IOW(DTRACEHIOC, 2, int)
 #define DTRACEHIOC_ADDDOF	_IOW(DTRACEHIOC, 3, dof_helper_t)
+#define DTRACEHIOC_HASUSDT	_IOW(DTRACEHIOC, 4, void *)
 
 #endif /* _DTRACE_IOCTL_H */
-- 
2.45.2

