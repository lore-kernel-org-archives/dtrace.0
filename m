Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A9195
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730765198; cv=fail; b=cPK8991K74V6T+9ngCO4+mn7cPcJon0uDepaR1mNEGOR9sY7U6cDjcAYKW3B3432OmINqiU2cEqlE33EsF1+wHC/wluQJN6Cy8E+8AxDyEFiKtWBm6c+08lQBeRRYsjLenBKDQqD/T67MQRnTleRKGz86yYiZzEHP4KM9J3yJHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730765198; c=relaxed/simple;
	bh=8OoQAhGq2fn2k0tQDzKZsS06JTE3H20p/2iIhYIKI/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tk9xe5Z35qmez8ppaA+KWPHGRJzsneMpu0sOEfqr7e5ExNFy+xa6YvjAGhqqcAKvl3dast6a/id/wF7TluKwuxGjFZ+37c/F8roEYw7kqzw7PsHz4QNDRWaPqECMfrWnsIx37gOqAdippcjhF8DBeNTM8SG61F1W6plH45pZ2Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nERmniXV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kgqQmxtm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nERmniXV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kgqQmxtm"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Lh2w5004620
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=2/bx+OKbDh0HSMucdrcD+GsrfRYt/varKA6ExRD4cR4=; b=
	nERmniXVmkuErEX26bkPp9kYphhTaGnU0w8dfd+yqYKnjYD0PuV04QxpIQjbr09v
	0iIXGlYN63pEKl/HcN3+9rOG+/5q2eQC7XAy0VNRjm5Db8jTtnlnkmiayTdtP/l6
	atELzQeZuyeoMa+tcw/YXGtJdZvCvX92QyZjJ3Pikfd63ysUvcE/35tvhX3nn+E3
	Bv13nBp7qmhGKaKZBn7W65MQDtO5tzTpsjg+4O/Ec8g/rnEsFbCzWHy6OQl3HrVj
	pLSzdq961y+IkABAHHLHQvdvxHfqLAvsm+V2iSeWq/+GX9FZl+GBPzDMni+kqXRg
	ojKcveOGKB2uyx4IFrgVDQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nanyv5nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4MEELi031392
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:29 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah67dr9-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWzAPZbESuLWa5EgCkWf5142SRE9Wa2jvqLZYlgXsU24eMVwoENT7bAPbmmhkbc2amPqJxIBArNG/3pkBZ9cx6FMslW4vxYKdFW3bHn4SUwviqukhoN8QevcNed2behUm1hQHAGve0qXpG1WO2XCkYWuYWj/iQPWamQBaJmZIAw472Dy32F9n+mNcgyZNWtlIT6D9ZHzw5RldlBuGMI77jCPLEOqafH9R8+AXoLuFxLBX4O56X7u6sXhFnjam+Pq2uuhtXEyiA6w54f8xja4a9/px0gphnvz4P0DwCJIGkwsG7prQ16sIf2ry9FQ9FKtF0lNa9ej3giKOSoEYLQwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/bx+OKbDh0HSMucdrcD+GsrfRYt/varKA6ExRD4cR4=;
 b=cKe5VjXvQo28aCbJY8lQCF4JLOkEWKYr7qJySXGeOHIbE/Bqc1131uPs3WVXxs9SkJRrhFTOrNKiyJB3nub+J/HwybeuRCfofMQdSp/G6KgpUGhGLFmf1eSbICl7bzbA/ikFavV7gyfZwVFRVJufRsCqTdgmkx8qm4gMV0DPCO/T2nt9lrUb3g514W49cn7egLliGskR85CrkZRiYBt3cKNqU2/1iohbiwolurj94V8O6h/TvdEERSlMnwZcTzwWGKy5BU7mxfQqM53ZCtQgoSv+kgki579WXHszQSdYHJoaiyE42pljQJnNugYt2JpHns/ffAmMKtHmbCmyTpR9Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/bx+OKbDh0HSMucdrcD+GsrfRYt/varKA6ExRD4cR4=;
 b=kgqQmxtmIPb7FlqoZx1TYslta0JPArEg27qsaK8FRXRNn2BCz7+X4qhil86tZ/wMowLUUJJ3FNP+P24VSEX429BLPS1yup9RCGsUSFWjP9BHyLsYBd6qrFAbpn5bD/TZ1yPN3An7dCljpnn+FYnkHsJ7qdB9tYpCwtyGdKIm7p0=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by DM4PR10MB6693.namprd10.prod.outlook.com (2603:10b6:8:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:06:26 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 00:06:26 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v5 6/6] usdt: fix create_underlying error path
Date: Tue,  5 Nov 2024 00:06:08 +0000
Message-ID: <20241105000608.333229-7-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241105000608.333229-1-nick.alcock@oracle.com>
References: <20241105000608.333229-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::20) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|DM4PR10MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5d565c-cbbc-4e85-a794-08dcfd2db0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RAsOrRi5rRoLrH8CLtY9acfJSdThpyik9kEuIBxlGlmaiOrAxaZvfFdDrIEo?=
 =?us-ascii?Q?+gKH852qNjBWOWdp4StqlBM5F1LDsU+UoRB7yGfCUbqmxVNlamx14zyV2a3V?=
 =?us-ascii?Q?vUXspMgnRu7hrH/wPCYvXdA6kyiT4GaxBCWEImFhzBfvYd/cdYYiuOBvX/qe?=
 =?us-ascii?Q?32V8VhlZC1kipJNPRWzmtwWZsePYhDSCDn1LnWRbyUnseToSukM3GAm3RzL2?=
 =?us-ascii?Q?kbWzN/ilR3agcCg8ujylG3idCmLo11fUU5OOpTRCXhIwCR+fQEdhZeK3ek7U?=
 =?us-ascii?Q?ng1UsL2WIN6lrk8LnB53peQSvCxDyr/DJCoPkjZnkrjkym25OrbJ8gThMAl2?=
 =?us-ascii?Q?47HXakRo7v1wnF/ZN3hsi8THAWJbnPoZEo7c8mfxjtp9ee9AfEYm5TXelhCq?=
 =?us-ascii?Q?LT5rd7Z0whnTyE7PLYr4oB/zsrd2JxSRbEHhRuZqDWkMFCGGEHcnXq4WTbu0?=
 =?us-ascii?Q?KSZ5DGn22pb35SigolHuHTecnXCI6mk6Pka6AiKi7c+M8xB3XsTQcAtBukUl?=
 =?us-ascii?Q?P4wXsrUtEYBvMApNXkqqYRTEvUBBpea25MOTsbCxh/HjVWzzr0tJuxns6YJs?=
 =?us-ascii?Q?D43x0Q4zOUx2mNZGSti4wBJ+D/w202vmsR2ErigcBToQxziN2s3rMQlyoP3+?=
 =?us-ascii?Q?lCuGv4ChNvfmwdWTxXw/w4He0qg/xa9/WL17vMh8NUpKgCArZhMNLrM4XdHA?=
 =?us-ascii?Q?VDUQSfXg/k/vlRrI5OLZJRffAtonE/BIYxTbpgCTbBRXmJMw7tW4GmTowKjP?=
 =?us-ascii?Q?AqNdhFK9tr62wfzLhM+V+Wv8mmy1V5bkcN7P7H4m81lBuAd7/kcMuL+Otc5M?=
 =?us-ascii?Q?AWFXQlnKumgbzHeio7SMRjpzYK8igQcmvPAF6KwnqtBsb6pZu9Ih7HCSo35A?=
 =?us-ascii?Q?nfwkcwjjdf5XjwRwJTQEluNGHbGEPDdppVS47FrZCqSCmiFijkNGC93rRhba?=
 =?us-ascii?Q?iiYHAFaDToieakbCWoCLwm9xDyjho4A29YDGGUbZii6Wu2pAnYmuPrCyeDIY?=
 =?us-ascii?Q?JOLq/bM4OpoU2HM7URdOsPigLQPZrcq+ZtBinHh9X0POtMODlipQou3EJzPm?=
 =?us-ascii?Q?G4pC1yX06bFkW5YMoICVwJxp3HtU1EiQwy30stMo7dz/3vijuvZwi7YWIwy9?=
 =?us-ascii?Q?t0jg+6NZIveX+Up6ptQfJfNB/EKZXM6/ZwZ4RO/jT9F0BCZrBW4nwk3VbVFD?=
 =?us-ascii?Q?kiDnzHniuPSeq4z2lzFdol4d6+M1sXAE6cYG4PP2RrS3pmQ/YySHNonYvPVw?=
 =?us-ascii?Q?PiDNxOOxybJlgNUQ/Nag2LHWS2WypTpjYHyS7b0PTDkhHmOW9M7jHal5kg9Y?=
 =?us-ascii?Q?jhOFEDA3l2Aw1eTiKjTWOUNa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nUKRHWko6hkQwyOXQAmaqm7yJ06sxx9ocgzyQGvUeB5BmrJJ2SMHgkxA4a22?=
 =?us-ascii?Q?1E0Yr2I7fbq4xt/vg+Ohs4mMUdKPOQmA7TY5TLJIZ4VsFesSEaWQu4KWkAMY?=
 =?us-ascii?Q?nYQqFbrfnbAj+VP2EG4msW47RK5IwrMbRwxJgc0S1K033JQ4r7sQgJieKJjg?=
 =?us-ascii?Q?GrcJ9FP3rsXZyZjNmCERWBHB6D4J8+iSkIbFPynoHei+wg6EnjZ9wYV0Cus5?=
 =?us-ascii?Q?WOy580oG5c2LeZaFmWqbOAHRs66zBoo83N6JLM7JR9hgASb7GEYcVPpQzEil?=
 =?us-ascii?Q?/Xfg840dYXgKf/0L0faDbJdOgqkK350nxen2Myez2Ki+IMuzkekjRtQFcTnS?=
 =?us-ascii?Q?Os/IuJ0IZIR9sM9j7XLTacqiD3rBeqKu4dsbJnOUQqyhw+uU51No9lCmqqXd?=
 =?us-ascii?Q?pYg5odUmbGVm8MKYfVebi7xJDpgFWK/XIG+h3pyOkYreiaZzsRZ+4C2818jM?=
 =?us-ascii?Q?+mTCOeJFdbG3fA/xFZIAOgzzYtpmvrTLyOBzaa7VxTl0BBKELrb+Q4m4HvQY?=
 =?us-ascii?Q?G5N0vHIhL24zAi19c9O5d5OI0+QHa9Jn81t/BVyo/K9a++R+hYM4d1+dD9U/?=
 =?us-ascii?Q?kl5xwGekEuYAo+8y/lJlJBWDwHzx4WEy6Nogy1c2fL9Xlmh17k+/u0DXVcaN?=
 =?us-ascii?Q?w0o/eriumIcAWzhn/+rZhl5SMwxg47zbhwE5yH64d2Ls5KFBEY8cPIwoslDb?=
 =?us-ascii?Q?xNEX+URQITZJyqeu+zNOplryjnJel2mJG4Et9yq9CaBiYQW2mCqvwS6ZErcJ?=
 =?us-ascii?Q?Z1lvu4oW5IQK+0B9HczJBKFgmxCUeTyvfsEsGu7MqfPnUGJdT+l3bm0tX4is?=
 =?us-ascii?Q?elFM49LUM1HCwCRnT8TBhpZkwtpTtNkgc6kSZJXjkfURYaNH0fyJ80J/2jJv?=
 =?us-ascii?Q?un7PN+rJaj0zRwqJ64wT8sReCemG2iLaiOViiGQ/GSqlL+sMnlyLuhp3FZvL?=
 =?us-ascii?Q?G3O7zbo0HGg4Rm+nKr6UkeS+aRQT9zauKQZ9A8Wv4g0lQZpF38/TAALripjv?=
 =?us-ascii?Q?KCbWHAXKreNpviXATDQcogRTHY12o0hdNz8fbi/bIBi0a97+tiB6aCejFO0b?=
 =?us-ascii?Q?QFPt3kV1bHZQXE5lUoLxE6iHuyMORKYH4SxzzEvlR9+qi78UBnPid+qzxZRR?=
 =?us-ascii?Q?1uFirvpPraIoxNG+jJWQ9Fhp4jLnCgcev90lJOYPReK4QWXrSzU9HhXl1IDw?=
 =?us-ascii?Q?Pm3mBP9sVa7JS+gfd97ZqjCR1aB3Yo5XKK7LchbetvojNGeNEdEug7QD3bno?=
 =?us-ascii?Q?HDRJTGFcUV2ZeXEXZXWGWblq0gM21RfpeSQmLJTWV+TnuJgn70noM384zZ64?=
 =?us-ascii?Q?3XjOHfuu8rFvYQRt+pX/FhLC5VIlWvWXI8Y2s8JTw1wx7LDsZBu4DazpUO7W?=
 =?us-ascii?Q?GKKRW6jXWXg6Zs0aEn+TpGx3nlJe+1BHtAcHZxPjxjnDOBQ2WuokYwg87D3+?=
 =?us-ascii?Q?z5uGEq555Netb6VWYy/BDSTUVY0upioSeT9cQHCkMcig8uxatYATlyuSsJd2?=
 =?us-ascii?Q?ENNY1cPeQX+eIZPbROkc3lDeIn5J+03qOIXQ48mlvCOB+x6rBKZLSeclN9Lk?=
 =?us-ascii?Q?xjZMGMxIn/H4R9oYbiifznOY9KMXFyYY2wMC6uQiV3DkwcMV3FngG9XEu/ER?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RZYQJ0oEU7wknuRz2Q5vJTVOdjBy16/xdr7x650CvIYK/706Gq5dRSSQ4RqP8AvDtnBu/IcHsaVo9jv+A+bETQGqa6e4aqepyC9t8mVvrOaezBpQjy4WavwVvzgoD4h8z/S60ksFQrL6JvHOSIXoHAFgyWVciqlNKTyDqqPKGnClw+SqR0umomYK6I7ZB/FMExFbkqfjkjc1jTlVPT/9euLRYRY2UyFJuMKbKfLfMKJ4H40BYy8m5SRfGymajMIsTeQKSTtI0fS1pFeT0iMpw0P9k6yZqF/zuTyk+aCG0AXbKRiV6233aR3sA4c8hGCZCTY86K4wWcLlPIWRXckB8c+iGex2fXEl363ZHHRioEG78ODFv1HYY8E8DGIqI9Ba/ZVYKQR72ErOC44yITpmmQeprU24mPGqnKPSuHb/yWVSx3ohQL5wAFgsLoDIPNcGMk+W/ZYhuAavpAAMciYW25L400YoV8iJPx240g0j+SMoYVBqT++Q1SW95HGmEz4OiZ8Lu9dTZtDRn4tve8cpktBoI9uNWIBwSXatNZFrrXpiCU2DIBu4/8/h4ZhqSw+Al2IIpZR7RFgjfSRCiGuath+43HX/uClcOPOxdfUFDKc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5d565c-cbbc-4e85-a794-08dcfd2db0fe
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 00:06:26.5364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdvguOsR2HPC/zQR/eiiLDdB6CWHE0HmRQ3BIADFLwi1U2D/iiTYlmvHNHfNzd8A8waD3sOhL4vBmlP0oj56EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6693
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_21,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411040192
X-Proofpoint-ORIG-GUID: B_RKPnvVc-2mA2u9okSkz-vj3IheJ9Ay
X-Proofpoint-GUID: B_RKPnvVc-2mA2u9okSkz-vj3IheJ9Ay

On error, we were destroying the underlying probe using the wrong call,
as if it were an overlying probe.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 28f5351be21a..5882644e03e9 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -716,7 +716,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 fail:
 	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
 		   psp->pps_mod, psp->pps_fn, psp->pps_prb);
-	probe_destroy(dtp, upp);
+	probe_destroy_underlying(dtp, upp);
 	return NULL;
 }
 
-- 
2.46.0.278.g36e3a12567

