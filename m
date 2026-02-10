Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F2613B58A
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770754613; cv=fail; b=fq1dumG+p5L8OAfqMAs7TkF8VMNjs2VO6KxDPlp8m1zOBRc+FXT/Kex0Wgs6eDLI11pULFzVWdD3ma567wfM07pc36Q01+2WOD+I7DR6fAbTRCEFO74bKYYhFvEXjQG2YRrLTi32cu3WQe66yAm35CDfW59yLvnGSSJbvYjdRDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770754613; c=relaxed/simple;
	bh=S6lNML2ObMu7jggkBkBkillvVqYDMHbezp8dmWe1nRA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qjDipJ/gQ/i0J4IB8RVNmPwSLqhOLeOwapDKBiyR6ocpGs1A+r3D57EB8HobiRvIzFvy5BxNoeu7fqd3Pm3Dy2iHKNtttqHX0UH5Hh87UXq9zuz9Xl5n3Zi/47go94jOuSvmyh6CiuDr7LEcLWp8VcIBDobL2Tz+jAl9yQOanv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TyZGKbfZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DxJflDgq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TyZGKbfZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DxJflDgq"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AGvKe3064864
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=RqKA89EtpquzIwb4W1
	8wSGOXeGWCwEUJyivlJRTMtQc=; b=TyZGKbfZzOIyuq88k1n/9T29EffkkqNU3u
	dEcH/cEcLbdevTQKGaK1ES8OpMQwJhP8VubUQFWpp/iGUgf0XO+H3AHavjGW8RvT
	K1ZsDaj913XA8nOus3flZ+6PTWuwrqmEwk1K3rs8GHYb+EFWyl2lvJIsIK3h+TyL
	PA50J1kn5O1/NUu7FDYSriSZXSYlBrp0AMgzdv5MO26yeyz9NgOZI08Yje2fCnqa
	GlIuLIQasfDTzZIBhejFdh+CLeIYyiNFaR70e0IEwMcLD9htFcZa3NKBuhiiA4WH
	bVQTsHIhnecktqquYTfEYowqaA69T+dkx2axFmY9O0f0obXlyA9A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88n7gd3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AJk9xL030130
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:48 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8228jhq7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8yHggvztHHLVrZsw4YjfOTevOhjh873LHyE8YjC5i3Z0ux3wFnmFyU9a6O37FX2HVuoJZarFCH62Zp60SKjZEsV/n6d8DPbw/UFLxEZZ2aruD7W5JaPPIOgOxjXwgXnhB/pStLv20LreyhesscaYwXPRII/IH0WRw07G6tDBAqX4s69qy2UMMDJ5PB1IwHmYyj9QhSInDfiG8kw7PheLGlajicCQpe3J0gthXFhSFc3ZNztzKLHPWXyGeE8bIBJ9xmJuhGZsrYHkKRn3usfbJSAbeP6CJuHRsB8QHYaNOu7Ja6Btun+h1k7Ks0bjpLFMBs3Qf6da6z0M5EHTgYxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqKA89EtpquzIwb4W18wSGOXeGWCwEUJyivlJRTMtQc=;
 b=p9OrqTrHnJ5rnNtwPFFEZUyssBesd5kC0GPk1PJSUj2Qd//Gi6yVx3HEkjtNG5T6q0+YkYrx1V+NmAayk9GCNFgrheaN0JL5qGbP0KwSMpBzbMm+77CPDwi3C6ejjXwS2nA8qC8a0deuuQVilQN+UtVJC2Nx2u80qf3d9yatMudRJW9ciOxfIrrwMSVcaWiCmWM4my8QpoBtmobb5EM2wE4uABV7F8+cy2uE/i24i0s2d7ySuU2KNDOQsVsT3bsI0fLyoJ/aaW4iGLD2RFo9NMiFOG2QH8MNh7dlMGWrLk8veEfqPdmdz4VHbnN8BbWguTLczKt1o9GTJq1kHbShJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqKA89EtpquzIwb4W18wSGOXeGWCwEUJyivlJRTMtQc=;
 b=DxJflDgqUfkeNKH1WbK2f3qAQt+DMQIJ2qnGz0Qug0A/ZPSgeyJtPhfMguHSDJ7vXbZgb2jLTKOleIdCbuaZ4cZw+Tvp8BXMYSjC0d0hLo1OsA4bQD8KAeuwanOuGffcSLytzWLmxaEnWlId9fInjf6a/VL4w8S6Im+iqoLqXRI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4607.namprd10.prod.outlook.com (2603:10b6:a03:2dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 20:16:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 20:16:45 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/3] NEWS: Fix indentation
Date: Tue, 10 Feb 2026 15:16:36 -0500
Message-Id: <20260210201637.8863-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20260210201637.8863-1-eugene.loh@oracle.com>
References: <20260210201637.8863-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4607:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c0941e-c58d-4bad-16a3-08de68e14fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+P/+E0uo+wgurCzsOWag73/pmpY9As0D1oN+PPZSu/RwCHEonzslptpxRKX4?=
 =?us-ascii?Q?vQVSf6Qie86XTFqbyxROC41Pm4KAUnEIcpdmRIujDMcLuWhdpOHGZFglAnxL?=
 =?us-ascii?Q?C7mNJxT83KuvZvGb5qipKASustpSp4Gn4ZTO/RNdloTPPMXu1e223FStuKPp?=
 =?us-ascii?Q?NB4SysiwGRDQqTYTgJ2oGcoO/NqUsX9znWgL9UYX5FZRSNeM0JnBkKuAqoqc?=
 =?us-ascii?Q?9jchGwYjIO23txj26MnQRuxYM92FfEL8Rt9gvLKS3KEh7Hu1qbdIPrT1oOxT?=
 =?us-ascii?Q?NS2E0GvsGIPGf0tnmLO4GgS6PkoqKF+OsFG9ym1coOvtb+iFRR36GrmEBXB9?=
 =?us-ascii?Q?T5ov2EwQA7ujfdngV76tA3vOzTBev2yOVvxRONhMCoEADjUAudBJ4EGJs9D9?=
 =?us-ascii?Q?ViEZKjUyTTeP7HLqas2NdF6286qPg02b2kyiw1/wxa9Zp1UpsnQLH0l041ZM?=
 =?us-ascii?Q?CD2haKB3GTRCBM7z+WFqWh57BoUrZVvragJMyQWsBPzQSnWqvNrHxjKZ60sT?=
 =?us-ascii?Q?dZR3LawOt7h3HgPb0S9oU2fSHo+MKBiYKGWsoZv0I/GKWXdx9QKDzQsDOnxZ?=
 =?us-ascii?Q?ywoXCBqyr/jzknDr9pw32R4V2/r9LNePbe+lQNi9bSo/nXI+phagFU/I5IKX?=
 =?us-ascii?Q?h9VmeXNDWVtCQL9LLVkBLFVN/aJXOZG9Mqp/hOjhRebXPnVHQgmEyJu1kH3p?=
 =?us-ascii?Q?iWikLJ5Q1AEJM4nabwSNXC12r0JRl2wS0r+Oy3NfJrTKEW1fPBoqNjWaICYF?=
 =?us-ascii?Q?hS1gT5yXRUesZRiu5olhwK0x/a6d9pmC9/HNJI19MeluFQ3OZMgR1/jT7PYO?=
 =?us-ascii?Q?7bob/g7MZ6aG482bNaeYF6OjXkxOGPGS4s4UwPax+Mr3GZBQdx7PR7pb7z8W?=
 =?us-ascii?Q?0dXokN2sKHT1VQVwZIgHcXcws4Yx8VbA34muU1ZhxwhVYYI8aPaN1oYeRFtV?=
 =?us-ascii?Q?98BtPpFWhiQ6IiwaIgflxuDm2CqpXSNs0KJW5Goxg6TSX1piLB1age2DpG+u?=
 =?us-ascii?Q?IXXkUBpt5ewGVyXcyVUy2F73Dtw/aiLO8oTsHGJeqnZL26GPkOE5Eaeito3y?=
 =?us-ascii?Q?lGLSUmrlAmcF+wA0AB2Cqaj1LkdaOkXv6PFFXS0kq3AmH0s7gnC5NPrNiEUB?=
 =?us-ascii?Q?1RokA/T4Z5c2SMXKiu1WvwH0RbAeS6hss3j7uY0lEeDd/O1DONVrWCb/IR2g?=
 =?us-ascii?Q?JEkkk5vbmC1bE1oumHVYp/OJgKxzp8pZyfrLD3a+vs+bK91strYabOX+v94R?=
 =?us-ascii?Q?R2j1Ta1ALuAY35AyMSdG0TdyCFa+/pickKpwIpQidwitgqL7TKBW0yuXVFs6?=
 =?us-ascii?Q?qKSW+OBk+UZokscNf2bIV/TG082QWg2/OWbF7/wva1uJwm4sE+rP6IfBHwfG?=
 =?us-ascii?Q?BsyTgMFfKRvwdOd8tUS7UOwOu3mjB8XjEYeY8ehwAE0ZsTy07r0cX9dEIvWi?=
 =?us-ascii?Q?XA7C5M42F95MeKF/Fl7XzK/4TpAbZG81Km9ioMvwsgMye58tkXDL8SIb5o6N?=
 =?us-ascii?Q?J69gbfqeVxn+PTxjfB1ZVOOTs1BztWtwzEnZzTM9FFRZcJhFkF6m7b15v8m6?=
 =?us-ascii?Q?gc+5mXv7XSHN6OSf9J8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u5jxiugPodNMf8MbZV5lz/fwtwxVLwA8XFvCD7afUpz1SyfU7QRRsbK31Bga?=
 =?us-ascii?Q?7MEfIHfGTQNH97BIWROz7ngQ6KTQATyGJam7OwXOxYbfHDaKjM2Ai4/Z0Z3H?=
 =?us-ascii?Q?xAZs+XHFaP8SYqkuMzlNSACNoKY9W5iSbvlZDExmOr3bg32/1juMDP1ftuBn?=
 =?us-ascii?Q?fTM6o7Xlke2SC5KJUJ6IYwnArK4nPrqPwxMLUc4L9E9mxav2nY3wKYd4NmsB?=
 =?us-ascii?Q?YeZg01E/HeFdc3yiYxrtusnbDCoH5OTRvnARbj4Y9fSwrbbpHeaCieli4aIO?=
 =?us-ascii?Q?ST2izmfxMrxz2bGH2xsR+kx2VSIAEE/IEmAbHPd4ju9uTviZi9nTvWCDDJsW?=
 =?us-ascii?Q?u4HIhHRGQONKaGU9WP2KcGuZBoOHdyflYIyGU2rtOqOX4kCVl+kM9T1wtLvx?=
 =?us-ascii?Q?hqnQKzpNgq78kGNjcRPhkqsxl7/mwMKJj/Xmuin1k1tbWUQhLo4n1i5ifNUF?=
 =?us-ascii?Q?Bn7e6aGdvyphSp1Rnt8JgmWY5orwrWvtXiB2/46W+sKonpV5AlkyNWiDucS5?=
 =?us-ascii?Q?Hvd6Bk2Nj9mIt8mi0CbtCvA1aAoPpBzn6buL79UA8KSJ6jA3ODx34r46VLr3?=
 =?us-ascii?Q?SUwvhazXdl7Kzd2GI8BMdAZ017s2Ko8C5mDQ8QZvMBHfOexVMTx+IenIV9/6?=
 =?us-ascii?Q?SxCLNFl0jtIQ5z0jucxZQhy7IMWtzMkWZGtAuFooExa2GDLcHLxA14M+nGgT?=
 =?us-ascii?Q?qB24vdhKz2betZnKFoHyq1K7fYzL8OZgffMTassx5tgtz0MqAEdSqMwsFdh7?=
 =?us-ascii?Q?+bMcohG5xaU1drS3zoUNc4QmG8Hti9KfvTnBzWlvlz7p6MzxTPFPW3V7zTDZ?=
 =?us-ascii?Q?sK1m+0XijGEvTrIyV++HtSVQSkS83zmV8atiKTuBsD2m9iyfkAtBVNErm2Ld?=
 =?us-ascii?Q?Fs4Woe9NVQEP8z8qMKaJiP8PXIDhru3IbkAUshVo2l0ww1flZiZ9usiTJoP8?=
 =?us-ascii?Q?IFIRbNw+UBQEfX6ucabnnkSpxQJrrNu2Q48lG8kr/PUqut0ZpFiWo3N49XXS?=
 =?us-ascii?Q?x/EueepxpCXvkQ9sZnJ0mxUNTOcqD+7Oarqo4uH7u3bTdD0UigJZsPDJZkQ2?=
 =?us-ascii?Q?pHYSIA5+qfOXtAOm3cEIEiWU+E/tIlrVGtZnCFU4NaWwwws//Su8yqqRcnxq?=
 =?us-ascii?Q?ARNBFOuPDzmF6qTPZQ3rVU8K2sgS0Vz548mJkqghbALHnuJLIT55o2J+R0iG?=
 =?us-ascii?Q?Yf4+Es2x7pQRnXdV9UXSaYdTu12P913N38wpAafZ7WuaFTt5JV9Na41V5a3y?=
 =?us-ascii?Q?YrXJs7Z3Fky4Ea56x7+zt3/t4Lap2xmuhSOCGWvvnMSriUdCeLzSTWkHOfCo?=
 =?us-ascii?Q?LMHdVy/l1sZx0Fv3TZqh5rVdQlAcZDHx4legryUnycBlgc+6yhegy2HMJeah?=
 =?us-ascii?Q?9U0/qdlZYjzjRVomurXZehLOjHSuQnbEdhzl9g0j9Nq9axUecxh2RB8uO4DB?=
 =?us-ascii?Q?rfMBVB9sXsiWL1Ag2mzs5GdC40d6i9d0U00D7/e7ahTX2i4DqLWYHijpNA5M?=
 =?us-ascii?Q?CqTU2oKxBfXvd8Tn0xQ+J7m6DdwrjGmpVWyHKhgEbWHFzUjrhTBmC23I4zM3?=
 =?us-ascii?Q?nS7BUHMAf0Jrrp8GCMqsQH87ezYDZTAft4OKBHRhG1iElKyUECPU+MJ0bGgl?=
 =?us-ascii?Q?FRIHddG8yfw6A5TB2GDaCXkfGCEyLboV+gjuAlhEQx45WwnzGxY/cPT03JwA?=
 =?us-ascii?Q?gpVZ9SPhzi/JgC0/einU64ozfcqrrN2WjllILO9RkAMwD2s57r6G2xo+efaH?=
 =?us-ascii?Q?LIuO40ObZg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wWMI5o2IIg6GezUIIon/ITqcJjMrjlvodW+g+Rvz27jIQo+D64jUuwsq47ji5PPObLjJUGYci3J2n2Z1FUMCuJ4DyyZ5DDTaUn2U0oBRe4dNwh7Jz12cnls8B9yOQOhtxpqAL7q1UMSvYQaezVGjl4fOYRbo2rWLUBmMXGOVhPuhqnFme5UG3hC6iUro4xTfNBGeXzbijUb+PA290wEaVenG4e1v/RpR1H5DTuTidcLAJCyyTTmQXWMm+B6Ps+ez1UI1Dwwfhhasvd8JFNyFNBwCf+3e2ps5hj4HaJBdzspujtRg2HGAARDpBZxlYPOaEhpYSaDUC+CszlN7NGdH3KXHFUzfl8pag/a0oSuPUP16TWWQbzoYuykYRNmskVawxkJR1SLlL+acqq9pvHj/Nt6LE0LCgSs+m7ezJGnIRoo9+Scm+zMjqV6HNo6Np/jRRP5h44uE1GJ+Uvjyx4MayKPoHYpVrqzCEt49ZhkGozKQdvFj0/jOMpSvpKOQH/hBoz8mfybd4xvyEeh6LGrGWiNUAFS5PDeHoAWZmkHVDdUA3UOjVuFWTPAvx+3dBWXNdz08YPh0vclpCEIXFSW0Bgv+70l2GyY+aCzNi44RGzg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c0941e-c58d-4bad-16a3-08de68e14fd4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 20:16:45.1148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwDEOJYCSPOommC6u3hXZNUwr99BkG4rqWiGCBSi7c7W8dzb3UZ3GnwOSP/baSc7rrm/l3018rREWozUXNtaYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4607
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602100167
X-Proofpoint-ORIG-GUID: ebnN1lX7PyEEXNdtu151KHdtCkRXTdVI
X-Proofpoint-GUID: ebnN1lX7PyEEXNdtu151KHdtCkRXTdVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE2NyBTYWx0ZWRfXyc6D1NkpPJ89
 5RjzvqK1WWj5cHfUuhNSaGPV68ERE5fgxuSq9WNELQ7Utft1Cie0dDo5D5x/Szx5csNrJE45Jxi
 p8jk07IBPcGfjtk4korCwHTmerXSPMbCZjA8iZe/DzsVL+sp6nIRxAV6Y36pYEsoA2ZBd36IyL4
 YD3Nb0f0jNHig2BvLaoyn4HGl1MuetwBepm92litSH/FudqOMyOa07whb0zjsd2GEp/SqPHmLng
 g3S0uyExWJM7CquGNODg+61e9vYBonjCIOTtBKIbLT/6m9u7lpyjqJS3AkDRXzJPU3Vynhx3N7x
 fHPu/btaujVuVftCNipWR/8v2soMC9fYQZLl78d3z/66phLoRIYHZ/AHhrVBjk9HvQ48YQ+scgt
 /WC16bSfGacAFrIltw1NTFChFA164U7Garzv7xT0C1rVbR6EoKLAN49twFOHj57HHbrljjxrXRM
 sukSE/LYhyyutIFJEsw==
X-Authority-Analysis: v=2.4 cv=O5c0fR9W c=1 sm=1 tr=0 ts=698b9231 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=26Sn6DwbkJ2VNwVrCaUA:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 NEWS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/NEWS b/NEWS
index bd20932a0..9c62e523b 100644
--- a/NEWS
+++ b/NEWS
@@ -39,17 +39,17 @@ Testsuite changes:
 
 Documentation changes:
 
-- Add the DTrace Tutorial to the git repo and install package.
+ - Add the DTrace Tutorial to the git repo and install package.
 
-- Clean up formatting.
+ - Clean up formatting.
 
-- Add missing documentation:  trunc(), stapsdt, usdt.h include path.
+ - Add missing documentation:  trunc(), stapsdt, usdt.h include path.
 
-- Update sections: unimplemented functions, sdt provider.
+ - Update sections: unimplemented functions, sdt provider.
 
-- Update LLM context files to forbid "if" statements.
+ - Update LLM context files to forbid "if" statements.
 
-- Update README.md for RPM info.
+ - Update README.md for RPM info.
 
 Build-time:
 
-- 
2.47.3

