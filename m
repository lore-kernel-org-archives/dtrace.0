Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E4DB665
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 23:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605067; cv=fail; b=nVc1sHQdO7gjGAlNXIwg5QOVIArJ2cNdToiWHwsAWafbmNlDxsFU4tjUsYYOQUMcohjltWCSy6r0ENooh8tRwRlQh1Qszb1ZeKlkxlZnWLTyRDBtXqXBEwGatPTmciVLejroAb6hdGe/jtOLPFO6Ezyb6JvSRA1cSQ6d7DJ/OM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605067; c=relaxed/simple;
	bh=dY3F9Gvkq3Nwqp8E6KEU9RIU1rl2uJD4HasMCWe+dNU=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Y8OokRe8sdOClqkullsphZeQomEGvqGpJjN9T6P00LURBrh2rz8rMgxY3/2oj5iJWYVU1P3c6L+BXMTXzgRQTy+NG+8yplDZO2fYQ1tWSwLOyqcmf6ilNedPKYgCg2+tEbqUXXfDnNjSu0Mfea4cToQgRNtD2O7ZY7RxN8X2Zqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FiVCIHrH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cI+n4xNf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FiVCIHrH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cI+n4xNf"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKWcrq3528727
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 23:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=eiGRUwLJJ65D9X/Ax6X7rkf4OC2V8TkmIGcIrR+fAcQ=; b=
	FiVCIHrHJletdZn/UKI4pvuspjc0UhsbvCit4+q0p8UGKAo7kmtRQTKCpmvulKCl
	4QKp0bEWDf2JJloaz7HiR+6IjCvzGQyE2tWSBSctGPCK5wpTAf/NV6i+p8TRPYrm
	GctxDkwhDbmNpheQeoQx/uyf/tJH2DmRv2NTGst3km/RwdkKbuIRIaLqCRij0OCy
	pr2bz4oCEW3lgKj5RDJ6NjwUDKAHPmijCxxH1Ftz4eB9EM8+WH7b2HT6SGuGx7HQ
	SuKW5n0IFdnhlzqLQe4GjZgTges6UkGbNjW5xwIwtmm1NucSfvpo1BEGijNrruhK
	/FuM4bDHciS0FbOVUZKAEA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvf005uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 23:11:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKv1Af036593
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 23:11:04 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bqvtjbnve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 23:11:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HI/0RmrAcqY0CGrDX7SH6FteKH4vCb35w4qqe90Lz9RYtLR51iuJ/0wofSgqivWvkHQvLvK9K5+XF4WbogKR0XIxoCt+XVdpj+/FQndPMTzCqdOR/0yqZCCMkklxEP0I9sfI1rZYwd8UmCzepXaZ2EYYXs9SzuY+PgqgDcFVY/gi1m3pgKrVCWjGdfHFfbc8o1IyQSCKmH4HbBC1vzQ7NWl0cQ7d4bIJxa2sA3JV36qdKd6Eus2SJj0QZ5XLNN8bS3KUNeM7cma9VvehuVzPLDzJywuLcdzFtfnMXzY2fDj8y+rqxUK34XvQOhqTogDuF7LneAOZ2uGAl8XgCsi4JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiGRUwLJJ65D9X/Ax6X7rkf4OC2V8TkmIGcIrR+fAcQ=;
 b=TWLDdcGMn0+uLaxSdZ62fM0EnvaRMe1RDZbOxt1xvlaRqNa2hL1S8YRDrkBOx/+Flmb2LiZNjJhE5rKmYolDKg0zE6wsP+K6JHZYCvPyc5IfBzhXA0HNnJ1HkfKEcoFTumWORvQpXInG04fvnUUXa/HDdsMRyBjOR7VrmwGANUqldseR9X3KeroJOI38kBs1XjOStT/qbKqYcpW5UBNLFqzqUZ3WY1vxWvXRsfKimTIQhUUnH7m5EJ6lsXwFr4zAR5Eb0vfqsOGJMyazptCNDp3fbdqsVUW5LnDhG8sG8XKa3fvzoOH5klI3gmO9nAATJNu/0+HaAd2Ui/MOicRauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiGRUwLJJ65D9X/Ax6X7rkf4OC2V8TkmIGcIrR+fAcQ=;
 b=cI+n4xNf+po9lRyIyzW2y0vFYr/70LC8oL2MfWjJpERM4Jph5PWtD7iEuzivp0fVYH5mkyDYWxaU4ELR7M8BVovNApeZUXXpggoCUyQ6FjLbq3LxXZJccGIzWLhiqdjby/vk1me6U5vQ+ZBW2tGAHSHSZ25QPTd6mnN0JU1sD1o=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS5PR10MB997752.namprd10.prod.outlook.com (2603:10b6:8:340::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 23:11:02 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 23:11:02 +0000
Date: Fri, 16 Jan 2026 18:11:01 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev
Subject: [PATCH] test: expected results files should not be executable scripts
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522AE1AEEB271BE04A500FCC28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS5PR10MB997752:EE_
X-MS-Office365-Filtering-Correlation-Id: 27785b1f-7b99-46f6-b2be-08de5554849d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xLs0pfC7K54UttFloeNPWjAw9H/3WwqWkqVTBbmtrTCMhOUrZVE0TWyt6A45?=
 =?us-ascii?Q?gaNWtbVY5mUBXZ1oly/uq3n6t4LeD/G6lU2VbViVWz7HRg8F9I1ULmMqcHdm?=
 =?us-ascii?Q?yVkNa7jCefWKFSfAS5mt2PUAYub0Qbehg31zEqwMCJIg92qxPHWWGX2Dvd7m?=
 =?us-ascii?Q?RlXD4SC2QZBDBdkBtv0a7XqLCQAj7Zj+KUlqS+eP1JID+PrERDcefUUyHWTp?=
 =?us-ascii?Q?tEa4UnzyXyLt/FVBEcMMYI63HL63L+PRExGwre0Vn1eyd/L16vCC+zijDYbr?=
 =?us-ascii?Q?0lIT40JyuaQxQ9cAlsJDZrXVthIv1pIbQTnWg3EAFruGCWOqD6vJnBYM4l/w?=
 =?us-ascii?Q?Q9DeMoRfExGG1Qbk5U4NR2Jfc2cT/KCNIttsnY8fMXfGXn7MNvulMA6xPtuh?=
 =?us-ascii?Q?GDaN8qpUAKoUB7anknWew8YWJMvdAzkMsfVmL1VftYGokkns9W3UZc+FGRuT?=
 =?us-ascii?Q?oeFV/j2BCdIZjtdUFRYpQmteWNMVyVgG0qEw1L6bdktQvSxTSSTX+CbmNATn?=
 =?us-ascii?Q?uz1dXG//PN6MA+fPrpZUE/CXmmQl38O5tPmYv9LMyxytvTJKnrbwHIc0HawT?=
 =?us-ascii?Q?wy3VM0JhdYNhazqussJqdCB4FjA8lMPNdUDUcxUH4q+OSR0tu3C9WdyXrOQw?=
 =?us-ascii?Q?zsl/RpODco9FntZmJz3kZmfdSD5TPbUy5MgKUBg61TvAVtgOwRKjx7c9bTAe?=
 =?us-ascii?Q?az8taSGKogFeF77/JrMiUrDsxpMr77PvMq56bwE2YJDvaJ1d3Q3uqWKi+nfR?=
 =?us-ascii?Q?7RC3xqtCOF1hlKCHMtJOyKHvdccxv+J8lqMIcNf3rJyCIt6JF3SPrK6coFPB?=
 =?us-ascii?Q?xUFJnTHsvS5OKbm7x9dnyAEfkN60gfjevCaU3nQPkFZApj5/d6/0xmblKXyV?=
 =?us-ascii?Q?Z+reFCm9MowH0nvHdSbnpNQGAleTJUn8Ekk6VCeWcxvK+ibIys0D7wi6bkdQ?=
 =?us-ascii?Q?wiNDpswgHD0Nal1umvDOhwOBGnWPIRxEjqSS48chpja3FPM2OdIj5Y9xhCEc?=
 =?us-ascii?Q?V96mivpRKRa4zjghfUaUzQCiDuatITnwnEt427Hy7dLjAUzj3P64DBp9A7Eq?=
 =?us-ascii?Q?+knVvC62z5ayzdJ1S5Uz8UnISaDwxCaUvKtgA+LdQ+B4ll5kpFpvSflcGrVU?=
 =?us-ascii?Q?dsArN10Be+RyiXPC4ykbgwOUVGQzzMfYhNGltUC02tsChNmO4xw/Q4esEWNS?=
 =?us-ascii?Q?rgFSbkmJa1WND6Yi9Nf/RyAeFrP+igp9ClOz5OeeGIMXfVnUtS88KbaDTPef?=
 =?us-ascii?Q?B984qg9PUbQ5BXD+atrLQA2o5L3d8+eqfj/vrwyUWZw/xFc55+ekXCQrM0XJ?=
 =?us-ascii?Q?4YPYDPuWCiBormQRNmZkFr4+GEDHcmgoXTBy72C5i/n86AS6yVKHadGdCz5Y?=
 =?us-ascii?Q?YCM2m8Q6mzwkMB7iLKJn7NRb7K9snocAS/3yDDGy2MI6+yK1vdfgL62RcuZf?=
 =?us-ascii?Q?nzPUO+2rUH66NOg8hYnhWtcWGwPme1+cBOXmVe8lR2fA83GIMV13w8NakaKj?=
 =?us-ascii?Q?BIZMas67pwglL8yk0WSrBCmZeQzgylkSJYJIv6p177kndx9UyKJHQL9Dx8L5?=
 =?us-ascii?Q?L8h2EaCQYIV119zDiZI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?70rABO7F+Zag5a7+hDdGOpQ4yx3ML1bueANIHoEv36CwBT8aOdVoUd24r2S2?=
 =?us-ascii?Q?+KMkcuMBb1/G03BgTPw5pxQ2Uji+PVD7SRXbVM3KfJeIZ+1OzyttfF6xGWeH?=
 =?us-ascii?Q?aJaRvUDuKcgtzomTWfF8u4k8jCdnwUki2z0WTUUL02MX84frP1V59/KTgFZJ?=
 =?us-ascii?Q?I371ibzuIHARWgrAjM/OCZpW0KH2vrGBzFQH+yxsq4AFKnRRzli2pu/3vivs?=
 =?us-ascii?Q?JxctGffWKQos8JKNLftC7zOhy5Sz69mF9PZMM4QnRdUHUMk/Mty0n/7LCrB7?=
 =?us-ascii?Q?KPytnpeNi6sqRwqku6vcUEXFdiXoJ/TOKNOOt+QadAFlilBKNu9Hc/LCudjm?=
 =?us-ascii?Q?lYSWCE2DlH5OC8xgOYgWyVZM9TC8c5TCFIVirjuVgj423MblGWJvOC6EQTJ5?=
 =?us-ascii?Q?yXfKw9NvwxqCbCLqy6JW67gn/edgl83BghFc6Llu1aekXMRa9ff+DVPT6B59?=
 =?us-ascii?Q?4CrTEH60OzLQt7ThrHo2nTRbv3J6inBdEYyQh/diwyjRYkb5HR6hbyiDG0At?=
 =?us-ascii?Q?+x9pyhyasMzYe6xfsJzjMgSNKgHAyY++tQJEtaIKhGRRHVCOGHexcO34S1iP?=
 =?us-ascii?Q?1Gui5kqzyO9UTRHKON9v3L1ZdxPg+eZ7cKNiPUb+W8ir83FBR4iE2W+U3S4w?=
 =?us-ascii?Q?K02my3G64NdfzJxkDtDJIMGWCRWDk0WnzoB0YOOYx2zk1LM4avbA8RdNKF4r?=
 =?us-ascii?Q?WRCz9HqdYUZAAMwAcndmcdp8PEckMGmrmJIMmmyN7lgx/imUVmgAhLmE+1C2?=
 =?us-ascii?Q?KrEP40HIz1KNEiOEeL3tWXozJtOc9Yefqt6nP0HUdSFARnyXGMOp5UgcYEB4?=
 =?us-ascii?Q?U4tRVZziZq/A1E6XtKkfs9SdF7KbNA/vKfHWPYpPzqgSFhiZ7ZsKYA4YXmRn?=
 =?us-ascii?Q?4HOHe1rhXxUciFOVNpFsoJYX2wlJb/1MrPrzSLhbAv78ox5BKQCg8AprZZPI?=
 =?us-ascii?Q?qh2O5PFdH1sY+jP8zwzhzyx0o+JikowFAhOWKJOLUAiZX36VVQbSnhGN++/M?=
 =?us-ascii?Q?yVvY/hst+M+NfYamEaJM/WUad7TB3qGNt8aih7EyGTI4deJ/cgmBwfhp5zuf?=
 =?us-ascii?Q?W+nI2JI9vKFRH47jU/n2vkuLRu2EmRhWAUIGFj/sx8CU4lbZmDYZ6xaLhiJw?=
 =?us-ascii?Q?Lh6A88P96l/1RGJWyMB6LLlMMXsJKIGcBQg/WQKm+DfIorsDaRI3rwn2imtt?=
 =?us-ascii?Q?YKYa8rajoVG5MR5MWAwcnelFDTsS70vDbHJyc9u5zhUEUfFMxslh9nNA7L6k?=
 =?us-ascii?Q?AtX/l+hMCi0fhm853jmtSy24kClju1WxMNy9CciAySClwiXQ/5Vjo5hb/NIc?=
 =?us-ascii?Q?TvF2u3XzOeqFKKFzvWR8dL474mBlh3EilipKZ/Q+7Gid6mMSnes1pa6co/Xs?=
 =?us-ascii?Q?b6TMJ0w/W39pEp08C5fyegqocivHz18TXhXkuAftyAeCyrHvyLaT33umCApL?=
 =?us-ascii?Q?mUSIV2NLZU4Vdl98uHlpqD1zxiq2Oiaaq/IJ8L5WEzLNcW8LiyvqKvzae/rT?=
 =?us-ascii?Q?ssYuWN1Zm+DS5qRIZQJ0Exzwk22/nssDV2/F0gMN5Lx1jfLVLrdv58Wn5v/z?=
 =?us-ascii?Q?Khipkb1noVYL/+/4XFhnVGuDk7hR7z/CkF1715oQj2iu82qdmSrFtPxdsL4S?=
 =?us-ascii?Q?BWaFLk170O4zAv4fVkbnDK+s9kjjS6VNv25e52Z4hGDjZtHl+TkzYFNcF3A7?=
 =?us-ascii?Q?WNR1/UWgJUoMKyf+Q7tT+XcNaZ/qGunJ1iiXT2T83sNZd2JWLq5SfJzmXBI4?=
 =?us-ascii?Q?wQn3/Dj5w/9CGLfG0ZGIVoRbxHdgNf8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LTukr6whFQ4hPxoW9vGdvDaWKyU0uG26dVlSSCVfNy9IBXur3YoBkF3IFfz3VN/hp9g4GYNyBTCBr575cozeadENuVwG152QBW+bUAOJxGejGuhje+aWelPfDJm51CZ4lOrWGZMbHlZI2WGHXQ2UIiBzhFgNVpHzs6J0tdAeytUUHco9YISxU/DqkkYs6/Otx+Ro+2Ea1hU/uXLTsBknP/bUkIKvr5RrHQn3HqX7SVa5EGDGt36aAnfFkJew3ZRN4RLt9hE/Q9C71G6yfkp/E2C/9zNNcPos3c9XAkSF4c5A4p3EHXXbQw9/lOroOkROtUwsPmDcAUEqkO0bcn8ymAxxAtyf2RnRnYTzmcdLCpSUscN3PDFNy7B5C1BU4lpiYq1wxZ20wH1KaUN17Lal17L5hU3WjKA4ew8yPqI3MEm4PvCh5Qg70EdRcKBg0mTLSqjAFNoxK4Cfet7w+ZEwHEYmoIHPisdBNw8+ROxpj4OKuk2kKPspeFtO5J0W14p4yT2E/s0ix20fJLYdzrPUEd/oWd9tWDd968K2V/l2QvCWQE73E4MHZD1Iz9ENQgaYBkvwCpRN0WJw6w4u9evQ1fbzMGUBKSSzx69Gbi30sLA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27785b1f-7b99-46f6-b2be-08de5554849d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 23:11:02.5299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bimYQkakFle0vESXm+XPfzfkKWJ1jVhRZPKdOs/G5+rChSB/aw5jhUcDgiFxAmlOKm8uTVtj/MQrrG2QuKW6b2rpzH/aBhFNy2xDU/aZZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR10MB997752
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601160173
X-Authority-Analysis: v=2.4 cv=AJKKJ3lP c=1 sm=1 tr=0 ts=696ac589 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Q5fRQ3yqeweb3U8okS0A:9 cc=ntf awl=host:13654
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NCBTYWx0ZWRfX/7gkjBWeUIK4
 fWlteMX1jnriSRQoYqKxrX+zhYccyqHyH3JpTvuoVa21z2QZ43LPIleAV0ARn3W6/HJ7j4i6MQM
 iSWKUiLKC5F0FZ9+zvq8NBnEteFM9D29E86f6ACXZ8bOqU7CgEKR0MOa6EVaqWekU70b5muFAXJ
 MgTEhkcLaz1gp+ophTP1aia13aKVfR+4EkDkqdVx+h78EOeBOl7CEWJMksJH2IfRp5cPM5mRzwn
 4Jqxe5+yWFRw0jiFP1FHs2Ccc/mm8M1R8Kw9sonr7QQXC5wGu7v6mOZ2JHUOT9QJUIv1j72kzh8
 ukItmgF/NoRKw/3AV7HsYY9LLPEPcfCK0++p9dh0FLILytnGRNCIRGRWxbbF8j5xeyHckd83ddO
 HYqCgixl71+ihsdeP3Z+fvmRMFPygC7uwrHqAozreoTvZYfjsk6lopyW/dT/OAuibEt28edXz2D
 EWRM11MVNoembpnxvVLf711XLY9GgXxODLoQeWvE=
X-Proofpoint-ORIG-GUID: pMrISFJFg1uksVIpUY5yPImuLsdnLCwT
X-Proofpoint-GUID: pMrISFJFg1uksVIpUY5yPImuLsdnLCwT

Tthese tests generated a bash or perl script as output, but given that
the associated .r files are not meant ot be executable, do not emit a
that looks like a script is not executable.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/funcs/substr/tst.substr.d | 2 +-
 test/unittest/funcs/substr/tst.substr.r | 2 --
 test/unittest/funcs/tst.basename.d      | 4 +---
 test/unittest/funcs/tst.basename.r      | 2 --
 test/unittest/funcs/tst.index.d         | 2 +-
 test/unittest/funcs/tst.index.r         | 2 --
 6 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/test/unittest/funcs/substr/tst.substr.d b/test/unittest/funcs/substr/tst.substr.d
index 8da15c30..4dcef73b 100644
--- a/test/unittest/funcs/substr/tst.substr.d
+++ b/test/unittest/funcs/substr/tst.substr.d
@@ -153,7 +153,7 @@ BEGIN
 
 	end = i;
 	i = 0;
-	printf("#!/usr/bin/perl\n\nBEGIN {\n");
+	printf("BEGIN {\n");
 
 }
 
diff --git a/test/unittest/funcs/substr/tst.substr.r b/test/unittest/funcs/substr/tst.substr.r
index 94d94e74..285b5c19 100644
--- a/test/unittest/funcs/substr/tst.substr.r
+++ b/test/unittest/funcs/substr/tst.substr.r
@@ -1,5 +1,3 @@
-#!/usr/bin/perl
-
 BEGIN {
 	if (substr("foobarbazbop", 3) ne "barbazbop") {
 		printf("perl => substr(\"foobarbazbop\", 3) = \"%s\"\n",
diff --git a/test/unittest/funcs/tst.basename.d b/test/unittest/funcs/tst.basename.d
index 86d80873..2b3d098a 100644
--- a/test/unittest/funcs/tst.basename.d
+++ b/test/unittest/funcs/tst.basename.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -38,8 +38,6 @@ BEGIN
 
 	end = i;
 	i = 0;
-
-	printf("#!/bin/bash\n\n");
 }
 
 syscall::ioctl:entry
diff --git a/test/unittest/funcs/tst.basename.r b/test/unittest/funcs/tst.basename.r
index 4f3aa0cc..fb68c543 100644
--- a/test/unittest/funcs/tst.basename.r
+++ b/test/unittest/funcs/tst.basename.r
@@ -1,5 +1,3 @@
-#!/bin/bash
-
 if [ `basename "/foo/bar/baz"` != "baz" ]; then
 	echo "basename(\"/foo/bar/baz\") is \"baz\"; expected \"`basename "/foo/bar/baz"`"\"
 fi
diff --git a/test/unittest/funcs/tst.index.d b/test/unittest/funcs/tst.index.d
index aab920eb..a918c386 100644
--- a/test/unittest/funcs/tst.index.d
+++ b/test/unittest/funcs/tst.index.d
@@ -60,7 +60,7 @@ BEGIN
 	i++;
 
 	end = j = k = 0;
-	printf("#!/usr/bin/perl\n\nBEGIN {\n");
+	printf("BEGIN {\n");
 }
 
 tick-1ms
diff --git a/test/unittest/funcs/tst.index.r b/test/unittest/funcs/tst.index.r
index 40f360fe..4eaa081c 100644
--- a/test/unittest/funcs/tst.index.r
+++ b/test/unittest/funcs/tst.index.r
@@ -1,5 +1,3 @@
-#!/usr/bin/perl
-
 BEGIN {
 	if (index("foobarbaz", "barbaz") != 3) {
 		printf("perl => index(\"foobarbaz\", \"barbaz\") = %d\n",
-- 
2.51.0

