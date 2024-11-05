Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBBA21440B
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 19:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730836728; cv=fail; b=Qk+UHFAw08t8r1jo+P9ryBm+FV3mIpp7NZGtD5lztgAKXuscuvlPfg4y78SFRHsEwYXZ063OdCg+sPpQJxgQfBvmhlc0bZeFAsNnMceuoBCYeqdvloCfckL7w/xtwbXDUNv7UR6h0Zg2m+FYGkeM8wyPLcvDnWzlMLkK0AX4Hzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730836728; c=relaxed/simple;
	bh=Qop+3h5DJQ0n0U8bM6r4CbRE5eF+PaINHl7c1jeVs8Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=NmNyCKBya88JlnKudpxxPN9nC/4MGfhOm8VGepQkfVY8RHupi9ZZrbz6dtF34j3idyINlS8wXpNOpa5XH2Psszq/xUTgpPhBF/Mdvr6lu1c5bp/I1ufovd32/0k/WZRdizRKJzqSyT8C7Mym/Q4I4ig05DizphLCj/UkJw6ZKwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UYrtdvTN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Are5OVYk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UYrtdvTN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Are5OVYk"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5JNSOu029639
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 19:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=a8XCu3ZiyGPdmOKutv
	YQeYpnDTNetYeyszooBXV3WdY=; b=UYrtdvTNkIRqWJO5XOgdFMS6dhcB+5gRJm
	kKNVQDnrZ3sn3G7ztz/vQEV2b5b+Wru4/klS4LjZfBdsuyfsBfvFVoDZDGZ7Tho7
	3exKZgvPNRlhhms+XdjY0jcuniv/al+0zZuxH7kw1SMSALU8qrMYONHqcEppDjB6
	JMu7lwMzy5B+4HD5CofYdT80xnKKZ048vID7Lpk6QPaPZ/ORJf0OQBbHLWg2tqEz
	m2yJ8SAHVaKTy9uOPtSm/Ghh2QB008oT9U/sE7Wmba0qgbYQ4dSF+UMZRqWzyqYK
	QB3NM+ajjiQabAJBeEbT4mDrTTSqTukf7mM4AaVa3fXLaxJlIj0w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nc4bxbn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 19:58:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5JQdbF005267
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 19:58:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42p87b16hg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 19:58:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYYMLa6uctw5/FrsoG4XKdMUcDUJX0LLeJqEmd6LWvjsWAdkxf5W0whjh7LhvOheXAin2uSmeH7vDMwrDOZs0PfMgmrctzSNM3NfHHZz33p7Iy//MUU4BatwPOhXaTAZl/kB9Rn8FDu8CNd8WvOVdLWXWC+qQQvBS8zm4ft2NZ8vyi1rk+m/z0vOLU418QKge3AkVUlBHxiyslh6AndTCsnEu0uQoAlfV2h5CBe3VuCC8R10Y/DZhBtn1BtjwhCEP5kmOguZBJtQGUiC2cQX1j+Ngd5LHoLVZ/SfVMJX9jR7MoZMG7PiJ82N2Z2CY9xhzHAMgCq3Lo7BGcjuAtiEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8XCu3ZiyGPdmOKutvYQeYpnDTNetYeyszooBXV3WdY=;
 b=SKAoTrkO/GUeEOK4Xsqt1ccN8P2r1b04lmG6VN9c+oZS5xwejMU/0QmD6hQ91NIonjdkgNv0xeECJS+T5EqbPly4rad7exun0JPcMwJRmS9BXkNP+PYzKK00BOzVmIEzu1ZeJwnvFxw1EV64o4vptGpZU6x/3k5czdg4B27ukbsahCwWa8KzSFrS4oPGkEE7aPElWbDgh70/2+PKFTtVtEqL41D8yaeZFmdQNzS3qsRCpn0HEUa4T00mOlhNDJHENlUXA8ytwHbSn9cwV2TLFzpMarrRUd/PTZlBGP6c/iiowRS0w6RhrkBoun2ZTIHuHJhwQqMZV6/RZy6tZKZ/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8XCu3ZiyGPdmOKutvYQeYpnDTNetYeyszooBXV3WdY=;
 b=Are5OVYkyNziY/Q/x8BssqNFt34upKHPg7+e6YWx0nHX5GZrr+vGm7DnTI9kSEb/d4FZeWT5CNIr5xoqrdpT2fyoDkqUSBeafxiJjG+daR8xe684EfbaORmt2JOnSoQe0MPj4Sx7SQ2clfhQGkY/qckvb8z75cmpfzRpZ82txS4=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CO6PR10MB5649.namprd10.prod.outlook.com (2603:10b6:303:14c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 19:58:41 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 19:58:41 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 3/6] cg: add argument mapping in the trampoline
References: <20241105000608.333229-1-nick.alcock@oracle.com>
	<20241105000608.333229-4-nick.alcock@oracle.com>
	<ZypV+dU4YHlxmICk@oracle.com>
Emacs: don't try this at home, kids!
Date: Tue, 05 Nov 2024 19:58:39 +0000
In-Reply-To: <ZypV+dU4YHlxmICk@oracle.com> (Kris Van Hees's message of "Tue, 5
	Nov 2024 12:29:29 -0500")
Message-ID: <877c9hfo5s.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::18) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CO6PR10MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: fac95a17-25d7-4444-2840-08dcfdd43eea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mv2PW98T9C72/0esuwDO7Ykfv3aJ00ONmE/6J0NadOLXlIpJhlg6ccrh/0fb?=
 =?us-ascii?Q?spoTjFr5LDazLg2Za08V2SPc5plD7XUzCGpjTWM9coZ6Jf/P6sIH9y3gGvn4?=
 =?us-ascii?Q?7Qsj2sbA+uwG8aYBZi/n/2b+7hn+FNPH99NCsPHPzG6UNGgG0bs1sAEn0M5h?=
 =?us-ascii?Q?c3spqicrvDGsKrADv0Xc9fp1OUkzZcx2sYbJGqsgaFTY7bqPeR3xi9VLWq/v?=
 =?us-ascii?Q?Arv8Pyqtolr13CEW+5nabkF9EqzAnQFedc7O7DRvMYa9OwPOV7A1mNsDtt3G?=
 =?us-ascii?Q?/ne3ua+mIEPt1AZOSYzCZPd0ogxbjh4yeQBYCg7LpChNPFJVmnd+sczIWQjH?=
 =?us-ascii?Q?neQ1WhhnHRIsxUxA1w3z3FXTnAKlhjAaiHNYAvcDUXyaH0sw/hDlp7yjkZ5E?=
 =?us-ascii?Q?UbrZkqZXgn6ZYkZHv77q0QOjyL1hv1emrsqLwWuFdw8Vq7qochc/r4FjyDmO?=
 =?us-ascii?Q?aSca1fkA1MnG9BC9YTZe3Dh17O7B8raoSdnlySg04c/47NqDG1i7e5+LGvm+?=
 =?us-ascii?Q?F1wjiTbyn49t3uAPffJi1QbM2Qeku44+iWiMKc97QplhiJQPoQHEueY0E6H5?=
 =?us-ascii?Q?PpCGaXRmQ4jV/JAX2emIYLQeLeZI2jfqprZ/l1Pt2dUwnzaKlOxwr4L7xG1N?=
 =?us-ascii?Q?yATZSPwnaO6HLIp5C3nZnGM/ydi4YZu4FsWkdoEtVZF7AhhfH7vBo5YAtli8?=
 =?us-ascii?Q?LJy9TB97kqtH1sGa6hnrnp2eslXPvIc1NoWEvq5ozlpSi7b2Lsz4LpVsyYV0?=
 =?us-ascii?Q?JR8IgmV9EGSzyYAqSSmmAJ4FUMZVbxzyR9kK9Tv9RGdu5MWauWHkr+Hes5/v?=
 =?us-ascii?Q?sHkxNYcPlf7fVRlhA1Qno40+eMFh8MNKndhGXBl/WzZ/mu6eKlS16IO4mtDz?=
 =?us-ascii?Q?UQjgb34gcZhSzpiv7FfBLioPnK7xGy6GXtkTcWWSVj582Njda+mEMu4JdH5S?=
 =?us-ascii?Q?neR+vjdxy57g5XZyNqaVIcUSCUoupGtZ2oxVY1GPEQ4u2WvrhJUohHeqnV2R?=
 =?us-ascii?Q?o+i0s2jxaB+AjXCO8ZeioKEz8awutkwm+xfLE/4iQ940jPQbZJcDpcgdQg9N?=
 =?us-ascii?Q?PTF7kEToQz2m+olYaCqGBKqEN8JsDHWYZG5Ejg0JkOjGC9yocXedylx50+0y?=
 =?us-ascii?Q?ENwBbYQJHiAqA7zsMjwduVpC06jXzm4mCuYjj0aXt3lN/s6G0opXdK6bYfmt?=
 =?us-ascii?Q?URVixRntUEMQxTlATNbun5zUXEcM7SHzJ2JV8nXwGb2TAmfbRMfATnDxlCp2?=
 =?us-ascii?Q?Jheukt0eF3hBDIzVlp3OSdzU8j1pUQQKFNLuK/41ax3RuIWnc8AiX0Ji2oaJ?=
 =?us-ascii?Q?ixAKKCCLWbgF/Y7emOomJTd0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HBSPwbzSV21GX40mOc1DX3yn8e/mNb5kjp2NOeZC98bLUHpeIKBKrhNTrLQh?=
 =?us-ascii?Q?+QlkJ1Z3IXF/EcFM/g/ZmoJ5oTUt7yX/KTbygTsSRaukzuCAo3T0IKiM68Jj?=
 =?us-ascii?Q?tYPgWZJBUjIrS+tCmLM8jLz4pRHxGj4WOX9uzkWfpTKmNtZEZIJ8ULuDfRl2?=
 =?us-ascii?Q?MojipTqsOw3yO5TmSQrDlUZPG7OoAxRRL2WW9rV7129A8WUyXjs+1X8qvAAi?=
 =?us-ascii?Q?SSWmHgB47TX6xScmPde7/m92VfSLOWsSfdiL2az+wqPXr7l9iI//U2Yeo10w?=
 =?us-ascii?Q?wCaR50jwOZGZoYS7qPcxYTPjBNLvWEKMQ5LAiVdA5n1WzCvwLUZAK7rRQvsa?=
 =?us-ascii?Q?JV2705xUVb/CoGW6P6aGocQVXym3mOoirOYBur9KHGH+u/cQDSG/vyC0QRRQ?=
 =?us-ascii?Q?bhnxWUr+0ANsEZTqeBv5x2jlS59D0VJcoE6QtTTUstAjWLTxKQE9PxKuSMDd?=
 =?us-ascii?Q?c2/LXZZ/v08nFXHoywLOzmTIN9spufEGDo2CN+ubZO8q6qzkh9SnDhdD1Zcj?=
 =?us-ascii?Q?FflmgF/QE3VoO1kCJsncH5tKR0uOJOGWKMJOzRsp7MVqlfBqhhsA3cRhtwL/?=
 =?us-ascii?Q?NYe905K+c7hM3QQWvH7zu7/Bv15zp9IpaAF1s+kGFhOFtu0w/mpfd4cr2o6v?=
 =?us-ascii?Q?fSSfOQlK4zvLbwY1Ju+VnXkolgYVfqZLLU3gdXBuXJZz6IHm0TA8SpXi6tya?=
 =?us-ascii?Q?sNl8ky6jzf+Zz3vO7TZuUrgI26JLnpOuNplL/7FdYf5RxlFA24lQTihQKS8o?=
 =?us-ascii?Q?vKZgX6qcdUO9LZHdhGGlkub0x0NpZaS0IaHQvplD8qQ5pjusOPo18laYt4Ft?=
 =?us-ascii?Q?TwcCqlTiZQFT1g2uHiBc033jrNJrgvT+hn9kcHOq7bdnp0ggr+7FsLkPHCdb?=
 =?us-ascii?Q?HF2nr7IlyUc0TUYJ85OrJMKvps8qbmz0Qq9nyBF8f3RaczMAxrFm6GQdOJqv?=
 =?us-ascii?Q?3ZNQfqRXVxMA88B5Sj02a5ajgCV+NJl2JcW2LBk3+RtoIGyP+HgSwqrxyCWq?=
 =?us-ascii?Q?eeB28gJ95eTB3R807kmvPEyAhGV2LYBlnEk0yuemXRXXD4LpeLoRbnYvMerk?=
 =?us-ascii?Q?19F3JCHcZQyjXJ/py08A9f6Ekd0JtPQx11EHWMrehnUOJRLwSkcr/tKFY1Jg?=
 =?us-ascii?Q?m87oWfiLuZICivA4h3sVF5dvlhIMPUYlX9qero1wcCRAN2d/Adb6kUB9FfZz?=
 =?us-ascii?Q?sIwwDrLVCQ7/fWO5vnRtV4Gdz0FzaEUwfzOEWaA6BnSD2lFfZf6c6cvbJ/OT?=
 =?us-ascii?Q?gTiCNNTOpKd8B2VhqSp+wbpEYN2TbUgElbfsU6r7Pv2TPwb4Ssx3xwcv2LSc?=
 =?us-ascii?Q?LzuTQtMncydfk7i3aAcLOnppJizGYuNkIuDhqC8/LZ0wtASd/s+JYkeYJf5k?=
 =?us-ascii?Q?SXrDs6iZidgCc8b0XIiTt70XxGN3XZVUzcs7dN7Zrdy72mPJ20UWZzEgfB/V?=
 =?us-ascii?Q?LqH7Elpo55+q1k2PxmmcXtvhQvLn8vhW2Q5otO5PTD6rVWqpfCT6QSzs/jrv?=
 =?us-ascii?Q?7IMbRffdEG1wfGp/OapVtc/dDe09KoDMCU+QYGSemaKucYef2WBWP3s5KyP5?=
 =?us-ascii?Q?qhBdFsj2ePkUHwC9jw0gTST2vj9qPiptbRn4Prar5FFmgJntyUIRAHtgR0i8?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IBjdX9TNXexfknjUoZr7GCEZIWc3wOHpttjygtJob4omanl6OrvSBf35T3qfJi8UvDFJqQ70YIXAIg/ePjc2xSVofUSsqDTltCK6ABPnbnldTGhKLQsqwj+sJ1BqrpguJXBs1I2nr2hq8nb7UseQhQR616OTn0vThqxzUmYwcfAe6nnxUMCJV7CPgcPkljnXkEwG6KsdTGrfMFRuZHVs04UxKZUY5Urvvyu7UbNeY+P8WKbsbLyv+f4iYjoUGxtIgTXkMyeMK/Svb/9m5ukEi1Cb/vc8mROBjwJuZMaVZoHKErbofb3Am0R4/Qd8N09r9W3J60ljVcGbWmnvSJ0Lkwz7yJfeox9NyMVSF2O14dnxHQ4P/cjCkzy7gjj9b39aUleIorCTQXRbZ9Ljbt6WAAek6I9Uox2oHT5Eem4QCf16SrZaz4qB1mP5G/SC0B8KPPCsO2Sy+hsN2wj2Mq3ojEUxoFAgVi0jEYUDbqLWvMH/98u3bFOrqhQH7Ee8Z9Ni1aoXAwox1kExafFu6RDGaNiJ5TGFFZQZpI3Y74ol4Cbj17G0S9rAC/LraUwkmZddMRxwx53rzawUEK9EviFrDQQ++l4hLHzQT28hGCETZcg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac95a17-25d7-4444-2840-08dcfdd43eea
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 19:58:41.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfOyu8d1uLCyljrSazICc6DgvoKx+/4WvCiZd0oTXKrBezLeT087tdYJmywSug9cors3DF2AitC0a70Qa+0K3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5649
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=873 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411050154
X-Proofpoint-ORIG-GUID: nLq2FFvNk7aYEvbYkGVnai-UOwEAM8eg
X-Proofpoint-GUID: nLq2FFvNk7aYEvbYkGVnai-UOwEAM8eg

On 5 Nov 2024, Kris Van Hees told this:

> On Tue, Nov 05, 2024 at 12:06:05AM +0000, Nick Alcock wrote:
>> +/*
>> + * Move arguments according to the mappings in the array of arguments given.
>> + * The original arguments are obtained from the saved regs, and overwritten, so
>> + * the regs must be saved in advance of this call.  In effect, this changes the
>> + * native arguments: the caller should adjust the mappings array accordingly,
>> + * and shuffle the native arg types to match.
>
> This is confusing...  How about;
>
> "Populate the probe arguments based on the provided dt_argdesc_t array.
>  The caller must save the arguments because argument mapping copies values from
>  the saved arguments to the  current arguments.  After this function returns,
>  the caller should adjust the mapping to reflect that shuffling has been done."
>
> There is no need to talk about shuffling types because the dt_argdesc_t array
> already lists the correct types anyway.

Ah yeah, historical wart -- when that comment was written, it didn't.

Adjusted as you suggest.

-- 
NULL && (void)
