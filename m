Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E7224677E
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 15:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753459054; cv=fail; b=c+yD1od73nrODiB57ETgwnlrzf1ykfXc+1iGeyToPA1C7dThIQhahHbNAw3dbB2VpdaaKNvRxed7EhWQ30mLw/Z3CHAkFM9YcyiiMV3ZACL7xw3mJ0kHamej2gapjmoW0TeOONEdoICaULMmTQhu5KB89TcnBJ4jGvUQB4l1Gw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753459054; c=relaxed/simple;
	bh=Pzds9gzJBunAqLK9w8U9LfNIc0G9CT2csgS9X9HGJBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gFycQObgawEJQccguWgABjKuwc9y6SZOSg2+we8PE+tgulsiqVShMz1l9/0cibyABqkRq9uY73e/0Um0fgER7lBhm/HSO1M66hyfDFWwi16mnzjJpxvIKDnddOVO/Ixd28n3R5wJj5/GCCe7xpZzMgxXnxmgfUxDTndMGbefSKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Nsj1ZNjh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XZ2bvR2F; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Nsj1ZNjh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XZ2bvR2F"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PEJ2uE032477
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 15:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=7XFDZeqCKewKcEJvBf
	kPPiFg0STwdI5mk7qf280dRUM=; b=Nsj1ZNjhk/1GkZ6Mfls+oHV6VabqKIO2wQ
	U6eohWhFSQ8IhBvFMqXStNC01ByEvEHLDOUpfTp5GTz8Rk3GssXG7GRISjqzRUAF
	KX+4LSa99a47Yjn8XqwMXMz2YCil/YMhnlW2BfsbxaY/zORB5n1Tderg4+9knlnE
	lZtkykYFe/+cLtJ9FrLTWR7+4g9bjnzpeXB4DMQAI0sBZYBXWyK4veq5S/6lEnJO
	/jwa/GH1+wBvbpbcG4HqvKGQkDUOF2/vj0zCwYUkJYo1O9mgfsnLYNqhRrcdMY09
	32Z0sbZbpdFPo0AQvBYFexr1dyrp7nhlg4Zml1egYrzJINWs0blg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w3whbq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 15:57:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56PEF1iX011025
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 15:57:29 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801td7dj0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 15:57:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwT6Szvuk+GMe/YV7+eMM/vs1BmJ8Cq7fG0/DLvEXkyex8yhPTTZDyq+sEZgmoObUf9zqAFkygj+QvZLe33A9Pa/DLICDgrfCFeiBof5N5eEYMCXu4d1njYYwEDqPYUPh1ic+qOXTAJWywaS2G8imfma/uKx7KNNmWkhNtjq7S9lyTJh86Yg1xuhYH0Kb/BnVcBaW92lDhWyCiUa3hN4tMaPFsfXhKJwjCn5TjH2ZwjhOpVLC6KiDqNO24gPea/u/43gQbj1Z1jvKjiLke2SU90MGS1IuMqF5UukOf4NRhCMMkW3HLbEfbB2fhUfV2SzuHdukhVFm5zKNprCe6vJiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XFDZeqCKewKcEJvBfkPPiFg0STwdI5mk7qf280dRUM=;
 b=LroSC4jjpowFB5IvZ832vlZotA1zvkN64TonZhUTB3R2tjGqp9K0t+W5j1iNAIpm9sBVEMyKeo4eb0DjBmCpoCpOCjPf2KXhR5EqFzeAuvonpqL0YB+RElUNJ/vHV7GvCzKNjixlt2+lN5VSVtUUp8fAeXcIVq3dLA3FgkUkmovC1JbnF05MLs2fRX1qCvZqNni6RdtOjZBtSsEK9/2k+If00P7YUyhdHWTzVB/Crq1UKff6EUJgmqJPII5HK3e4xvS22M1oij+7RKHA2kn9ZCALcOdYFsGyJBzHzWhBKrTmdOlb8MK0POPeGzOTtj60YZFopeC1wXJzGA6nrFE6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XFDZeqCKewKcEJvBfkPPiFg0STwdI5mk7qf280dRUM=;
 b=XZ2bvR2FCrHCjFOa2UGPGMHhMZRuqXJw+9/p5fMA6iBlItKpUbYu0kSaRGR2TXcGtgf87CI0RqqmViyBmdAq9vrB+u0BeJ74zxJYKwC8Nyf8kijj9cR6iRtqycPhpVdpoqzzHWjw/7okJWgmK8VRsCLvtPNZV6UjQSBj0G9PFlk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SN4PR10MB5624.namprd10.prod.outlook.com (2603:10b6:806:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Fri, 25 Jul
 2025 15:57:27 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Fri, 25 Jul 2025
 15:57:27 +0000
Date: Fri, 25 Jul 2025 11:57:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 1/6] usdt: have copy_args() count args while parsing
 them
Message-ID: <aIOpZMcLIE14zBzs@oracle.com>
References: <20250710215930.82067-1-alan.maguire@oracle.com>
 <20250710215930.82067-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710215930.82067-2-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SN4PR10MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 761183c4-3f04-41d8-8303-08ddcb93f3d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sr1KlZBmvELqmboShG241vGYEACtRDnVwrQeMAdMQbT/KDAD1OmLmWbNTlrx?=
 =?us-ascii?Q?C1KSPVEsZD+0ggIstElvJV9wyX/NlZAv0KI/ixF4LyZ3Bqp9ooCrsB0X0e/X?=
 =?us-ascii?Q?CvWyUCXO6MLBqiGstvS0ENYR8CmaWzLKql4D2FT1YY0PZC4Jfk1RMZuR5GHR?=
 =?us-ascii?Q?RIYUWxL28Vc7RNXai1LVIL17C5D5vnBHV7Yl5xFxWsjsrDMOdAbcR7BRPWdE?=
 =?us-ascii?Q?yoPNDPDX8TATlcDFutsb3wxY02vqFauc2MMF6YMuFTPASDMiR+vfEKwHMvPw?=
 =?us-ascii?Q?unjveW4TVH99o5E69UjGXwC7tebwprd67mIke18cpfNE14vP1MRMKe/J0M/5?=
 =?us-ascii?Q?2yNH2RaBNdo0TnMgn6V5D8afl3klK1VlXP2qwbi0WBOhIKl82PjCiltKFrjh?=
 =?us-ascii?Q?9xM/Pq3oyk8U3oeavnwhD+o973h3gdcL0o8naKf+1c9yePw5TB9R166IaQbG?=
 =?us-ascii?Q?45C2a+X5yxTt4VdaAT9zDktZhzz3jsTW/BmfweWdmM08aCV/sKndMgF89VYm?=
 =?us-ascii?Q?D2VAjdfn8FABKL7JH3Or20bX0mXSql9nIJ1/QUw7bEJjSF8yDMSsrR3Ejc7Y?=
 =?us-ascii?Q?//uGM6YolqMCIwchefy8KKRLIChplv5OZ+o6NzPY3e5htDTkS3qjVvF01ft2?=
 =?us-ascii?Q?PosPj5GezGD1mfOwMF2eimtYGxSb2nLvxduVZVymDaAmXqEgRZEvM3axW80Z?=
 =?us-ascii?Q?E/2Vnts5yr1o32aa/EXM+bNYQTkkP/4GOQqKXgf4sEj/gMPY8UX36dBobEK0?=
 =?us-ascii?Q?Lfd8ENww6T1Sozor3hNKMMGJXnLaPTFNlQFPvTbt8p9PuB9Va4fuQRTpK77b?=
 =?us-ascii?Q?eUm7TUq0SxX5h+uVjge2So+2/QWeelJXcQqEJMXrPFcPmIFX4ox62kkp+qoo?=
 =?us-ascii?Q?YxhHggxcVEb2OQAtG3lI28EE5eX1HVURdiu0QrT7a3OWXosnUiueduPB99nX?=
 =?us-ascii?Q?KB7xGnDboD1GGyjf+t4C56tAPruX/jj6T2x/REm7WbVyQx8jFWjEneiXpS/q?=
 =?us-ascii?Q?VKf/9+RjXuuSQszRGipkl6DD6E/+nxRTx6RMEoX0DQ+TKzzAx6/PSROaFF2n?=
 =?us-ascii?Q?gh2kHTaUNkBxsE36r6SAmJDxiZmiAdhPLyUZ69mmaCJ+wLeesKrlDJq1B0Ux?=
 =?us-ascii?Q?eAHqVxBRrXhGAXaCc96OW2O2MugxkyjHE4rOhpsYTz3AifjfH+DCZjI3Q2fv?=
 =?us-ascii?Q?blEIfWT/fzfH8JHPvaBiC2FbMYdZA5Ctf1MRiOaoWEnD2CLGVEMi6njiT1Yc?=
 =?us-ascii?Q?YFJCFBw7JsIxYipY+LnaO7HszdP59+hK7Prv4C6Mq11IkAeVUu4Ry1LKqD/e?=
 =?us-ascii?Q?P7RjZ9ux/YI8CQstqs/WRHZIDzIFTcdvNbXJ9Gvy32rx7Q9bj78qvoZ5WWfv?=
 =?us-ascii?Q?xsZPeuqwxwK866cCRXJTgM0MqJ9ECY01VWZC6g9BydUxF8Xc8j7ORSRCxbCm?=
 =?us-ascii?Q?NdwGT1h9gGQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DlYSCVTV3VKckPfx6mIrn1KLdwJoKLxDL5SLJfOorkw/lEiFzhZ+ZLE2WtNg?=
 =?us-ascii?Q?WIGtBZkFh7k3gyOR4DMIc4oVzo9ct0MzbPJ9PPCz9F2zc9uCWI7VR0x7piZe?=
 =?us-ascii?Q?zOus0AdImosgGbALcE9//cY4+JAIUZ8KzLcbM4JjhBPBL1bupS0STExa+gMT?=
 =?us-ascii?Q?kUtbbm5TO++pAOFfmrx9d+fiy9z9kYdlkUCGXuZXXIR/uR98Mpd0Q4kKqcO+?=
 =?us-ascii?Q?MemBkI4zqPm/BSNhKnahokBJ3Hng/LZIG5TV7lB7wmB9SLHeKCSsDlodDMia?=
 =?us-ascii?Q?Z/dK/cp+UbAmPaibEy720/5oVFTxa/ra7FqTL7TjODZoNzr31LnoyPeW6/eC?=
 =?us-ascii?Q?XUoabXzWkKJkellcyelMP98/INHgahLBlHBPpmld8SuiDAT72Aj17CCUYIyA?=
 =?us-ascii?Q?QKDyQnwgccLhKHUKWf8htL9mrrq9skRosJmDG+3dBx9S+Kxtzf8UwsGmk7xx?=
 =?us-ascii?Q?A8/UQr5799cOsiQM+j+VO8pEk1A2ZqpmupSvhkxsdxUL8jAe0COC+Y7uHAV1?=
 =?us-ascii?Q?xUqtpO0mYI4XDnjuNJn4WTbiuNOIvBoQ3wWRc+r5uDFFcjCSfvg6pMEAoEBR?=
 =?us-ascii?Q?mXWYO6shesMQ5P4BnyxkAvFjCfusuDGLhZNEcvNG/TWVMXqVwUz4ROobjDtz?=
 =?us-ascii?Q?aN3TClFtykwk1ANS4L+9e5SScfroNkoH5KV+lSB6l0oPyILOrHRPm1ivGqyM?=
 =?us-ascii?Q?jVmzE17QsaiD33/H5psp9hnbNmtqrs9DdKv/ikqfTf9lqkCo7MfxCbzvy0Hj?=
 =?us-ascii?Q?njoeVAKPU/RopVG09PO9FuQalgu+OY/ObyBZ+oxpIYo9cwqJUy6Y8pNp8nNS?=
 =?us-ascii?Q?9KgkEKDXAVp0rXaZrgVAmilu3UG9OYPj6yJxznv2y4C4P9VOVCWDGJCXRFfj?=
 =?us-ascii?Q?PdaEut8nvIhvNFDnIeIMx3zX3crJFjdzwc3DNyBmBGEp1Vc5ink+z9Yhu7sq?=
 =?us-ascii?Q?vGolWfkVWOIbeuYi0PdUcHp86CXum7m/K223JEe5p6nBJTPgXS0QQEfdqbfy?=
 =?us-ascii?Q?Zg7kZN8htdxN8X3iWSF3MHNGvkLKKyDB0FkOvduoXoVk0JY/6gtcrETMRh9f?=
 =?us-ascii?Q?97xatAvPXr7CZyoDRekRh+RlLGYCmC8kLZbhlk00l4hbOm4/gzWTAzNknXDW?=
 =?us-ascii?Q?mzOvHJSUS+AIkTzMsiT+7iaUUqdVO9WWgRgTxjwwQpAEDyKcrkVY4GCevMNQ?=
 =?us-ascii?Q?5QrYf4xRWjxdwm15FdliUisL0qJW1XrnwWxdquzLSVDF5oKlDMxuP8XnnzYP?=
 =?us-ascii?Q?dc0Ms9T8aTYtfSqR3zROlQSRS5dbf6vi78LLVGxy+gjK/eXWLwkYFrSzz0cl?=
 =?us-ascii?Q?gtpvVhlbt7T2MElcbwS0VWkqlPQ2WcbukC5aR+eugBsZaxXsQz1m5Y96TuRi?=
 =?us-ascii?Q?UltMuWLzax5ly5HgBsicaAsm8TXaefBOT34ENtn2xmxi80VhZ5TPAlbp7PtL?=
 =?us-ascii?Q?NYw8jH4vG1PexL5lEqBRpAfPiEFLPi/V20Kamx63EQE4CSDKwDbuvi5zM20i?=
 =?us-ascii?Q?Sg23Zdc7BxXkEhjJVOYJ/lKWWDJuAHl4+rW8PXn5m5vzkp1XgqtZg+EtTAdF?=
 =?us-ascii?Q?WeaRAT2s3cgDUn+irKWh+bMFJ51DAzxXJ63WFpoV0ncOTxW3PHg2clexH0fW?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PisEAnxKRNtiB7LllMzkf+6JYUBaa/CJGYS1u8cs5Hs2JH/6UwCWi3B4MV8o8AzrPtX8V2IK9uGBPYKWDAcWGEntgWCk2XWKy6u5wT6NKUnf0N3WYzigVDBddzjfuZdkqsV4xXepyVNbB3FGsahL4mfeXC7KRAob5BjpOSAo6T9u6ffwfsVib+y71VL4U4QgHvHvJQC4Aevl9uaVn59y1Xm7Eu+h09Qik9JT26yDqRBnMuF+n8bjc93F17ql/rpXuzxFaKRGZF/3B0W7lTPgUtndYoaZuF8J7XsF87grgyzjXMIRuXtdIRaMAs1MPzr3F+PX/uT3yI3nLkJ1+QBE6807PeV+ovZLHtf56iCfeYEh7tXqrbYIWmCDRQjGk3zOkuIme2zkvSwzQa7VZbIr4PKALsqMtHIzNdb70TdHaKBCW1/0EcRovdzom1Okv6gAK0Zr1A7ee/u5RqBnxJK2x0S5UEOEr9v7Gw936Hk4vNT3oeuj7N4wnQvzCoezR3mlY8OmPZy03o7dat/e0xKrKYWJ4MTYSZS1QP854R+b2xV7aw94ACEX7uhG4TzUtB3RXo4gSxxxv0iM7S+oG/ogv6Z9B5QkNKuonipzoGA8eXM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 761183c4-3f04-41d8-8303-08ddcb93f3d3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 15:57:27.0148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niG6j2Nc5Q3IltRu3XSrLttYjd9E+DX+MOvP8bMJrsYcmX03mQxiPr1EIZufUF2nbMUYAqKvyUPI0UlIEVPmlRDlBqWYnR4tIgIqIzpEzIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5624
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507250136
X-Proofpoint-ORIG-GUID: K-94PQQAS5iCpzaqsLIB9iyE7yi_JPu-
X-Proofpoint-GUID: K-94PQQAS5iCpzaqsLIB9iyE7yi_JPu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEzNyBTYWx0ZWRfX4R21ys/wQ4E4
 lTkIZu93DuL+W5K5x6Zlxv30UKXoRUSpNPOpSe9ldBt1FcSe9NB/fIgAbR0q0987SrV6AMA5Ag3
 Lp+6H/WbStdRWksHuS1jar1ii5cxxSs3sxImtHk4KokqR3/1uN5GAU2+1Ar1L45DQy6GNvFEaMg
 scRoYQDxDxgfbHRf/xP5kv1nZUfgxQNKMLfkKF2Ka/V5NXEo3WJHV7se2t28OoElNx1eH55PcBm
 NUTV4M8yPJyfz0mW5cwi/SyJ9hwVCWskhrGHcpdXrsvXbI2iN6NoysUmUcZrW1T4SeOWAOajXRA
 tE6Apc0FnQow11ESFOBx/FtR1XME9sq9PheFCb4voDRV+cn2RS6qDv1TF4ZszIeWv1ZbNCrzs8p
 rJtpx2t0ePr9zQc+rhMpL/uWHrOo+pND4cuaJElx8J1aB70J2JC/LLxXypwOKW/VBpUXoBWC
X-Authority-Analysis: v=2.4 cv=Jt7xrN4C c=1 sm=1 tr=0 ts=6883a96a cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=jKW2EHiDRbMkB6MISB4A:9 a=CjuIK1q_8ugA:10

On Thu, Jul 10, 2025 at 10:59:25PM +0100, Alan Maguire wrote:
> stapsdt probes do not include an argument count, so the only
> way to count them is to parse the parameter string.  Adjust
> copy_args() to set upp->sargc while parsing upp->sargv.

I am looking at reworking this a bit.  The main challenge I see is that
it makes the overall copy_args() loop slower for *all* cases, not just
stapsdt.  At a minimum, replacing the strlen(p) with a check for *p != '\0'
might be better.

But there is also the issue that given how late copy_args() is executed,
setting sargc become a moot point.  It is not used after copy_args() is
called, so setting upp->sargc becomes pointless.

On the other hand, what we do want to know is how many arguments the probe
provides *before* we compile clauses, though in the adsence of real type
info, we could get away with not doing that.  Having the number of args
allows the use of args[n].

> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index cf5cfd43..2cbd8910 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -1145,9 +1145,9 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  }
>  
>  /*
> - * Generate code that populates the probe arguments.
> + * Generate code that populates, counts the probe arguments.
>   */
> -static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
> +static void copy_args(dt_pcb_t *pcb, dt_uprobe_t *upp)
>  {
>  	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>  	dt_irlist_t	*dlp = &pcb->pcb_ir;
> @@ -1158,7 +1158,7 @@ static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
>  
>  	assert(pvp != NULL);
>  
> -	for (i = 0; i < upp->sargc; i++) {
> +	for (i = 0; strlen(p) > 0; i++) {
>  		int	ssize, disp, len;
>  		char	*reg = NULL;
>  		int64_t	val = 0;
> @@ -1425,6 +1425,7 @@ static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
>  			usdt_error(pcb, "Unknown format in arg%d spec", i);
>  #endif
>  	}
> +	upp->sargc = i;
>  }
>  
>  /*
> @@ -1445,7 +1446,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
>  	dt_irlist_t		*dlp = &pcb->pcb_ir;
>  	const dt_probe_t	*uprp = pcb->pcb_probe;
> -	const dt_uprobe_t	*upp = uprp->prv_data;
> +	dt_uprobe_t		*upp = uprp->prv_data;
>  	const list_probe_t	*pop;
>  	uint_t			lbl_exit = pcb->pcb_exitlbl;
>  	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
> @@ -1519,7 +1520,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	if (upp->flags & PP_IS_RETURN)
>  		goto out;
>  
> -	if (upp->sargc)
> +	if (upp->sargv)
>  		copy_args(pcb, upp);
>  	else
>  		dt_cg_tramp_copy_args_from_regs(pcb, 0);
> -- 
> 2.43.5
> 
