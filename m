Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B845148848
	for <dtrace@lists.linux.dev>; Mon, 29 Jul 2024 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722266874; cv=fail; b=IFrtn4armZC/EA3RF06pl2fKlWdJvwUZU2yNDewywuSP3TTubBTxYvOLXV5u8Gyz7PN4Mn0Py4uyObEabZgdv8w7RTuSv6pMUY4ay+/woLJSiQdzOIxJAXEeeGyp+6Ek5JenKBr+iTu1SczG0N3SJgw07D71InAVlJ/wt4qlbZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722266874; c=relaxed/simple;
	bh=UVh/F2oZoVuBdOzQhzaq+38XbXmncikLECZHPh+ifeY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=PHNV3+QLI0OGyyjjGyHbiGVjdW1c0m+fSkbomIXLfWIMsodbjIe/U7lIOEQlcCFG9ONey0x1gdQWHX+VSWlaN76mv0OeqFZNrNSAclCTViLCNZiDV93Gnr6NdBbGDqvImD0SkerITymLlXbW+guxJOaviyJvW7nqk94PVe15qKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QbktnyKU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yaeL+kji; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QbktnyKU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yaeL+kji"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TFMgFZ020333
	for <dtrace@lists.linux.dev>; Mon, 29 Jul 2024 15:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=USknmTdB2hyqKo
	iolriwiYQu79zHtIIyF8PV1PqY5fo=; b=QbktnyKUe5QNQ7c5JjsA652bPDb98x
	djv0ZUdEIo53Nv+e+lTbjZGG7fhYxUIdVJWcrmuCI5cxHA20PMzy8aDYAL0J22m4
	5tG9AaYNSGUD2dA/h8YdRQfpFeULgEiaqLoLmjZq31NAzn+nrfUleOTo6xORD4lV
	R0fqH5MmN8psBS0XinltlMrRxD5Bzd7mdwLcxcobawjLCKP4o7fI5g3hyGVZ3tS2
	Rvyygr+v31Gk4DvcQsXMGRTEJaMEMw+qp4G9I9wQDRiHaNG95eRh/AiiZcV5T5wO
	BZGJPhX4+ziaMBGJMy0nJDy9Tm+6UfVZIgt+3dM+00D4ofwTnMczIKjQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqfyaxhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Jul 2024 15:27:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46TF1xtl005879
	for <dtrace@lists.linux.dev>; Mon, 29 Jul 2024 15:27:51 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40p4bxvhqu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Jul 2024 15:27:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptXl01W0+T9avqSMiXhr1piw3UJKF9HhdbXTEjQox7mk1NHuKXIeR/WIaZJNNzx5CYVxbCLhnHFhsEcjl7TYwkfOnDyKEOTleH1b5Rl6IXPI6UpVeAJxkDHEe0F6loeSA7GxKMhHlqbVkVWmTtS7dO1iwdwm55TfWfHPc71FU+/htjaQgj2UkHMrGHG2lip3hTE1fmOBKsW3ZHgU8cJrAP58EmXeU8savZy0iXn/LBe26I6NYfYN9mOxt+ldvABBdWK6O6LO/xmMQweC5wVy0+pdpLDUVwU1jXs/iiBSP7XRNRektkzTEqT/b4mKpEQhD4ffQvGwsvW4McTgqL0Ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USknmTdB2hyqKoiolriwiYQu79zHtIIyF8PV1PqY5fo=;
 b=hmz2f5fPBAB7BKfbH+iGcfhnNmlfpwq4tAuK4t09CG4VfoQZI2xbCq6CrSD1arY+Zud4PY1SOeZkcmx3E4yuJI6dL1k+3BC0/G1FYPFMFV/vBTVtorYZj6xq+fVP6gXU8i/bk98imfRPGOFh8B3UsKJIp+/Io8HZu+lRbshLKvpS4wDrRjqAHMaelAfhMtkiyzJRqxczwuWsfRqHRjZfAA4UFWF1Z/rXZvcJQkpFCG/QjMGu7PTRVJjnz/IbmfZR9n6mE/ykT9DpYIzU9QXZd22YTdk7fNKdGAUF3mbOtOT36itcBTutCWL3c79F19kG2ccLUxpFDtzvjHFiW/hFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USknmTdB2hyqKoiolriwiYQu79zHtIIyF8PV1PqY5fo=;
 b=yaeL+kji7EuNzFHqU36nEdx27dxddEeZZ11p6PWxloc9ORhf2wK0AgUhp6xs+/uyADcy1vq9rZlQ3/P85F7aYe4pY6NticH/qzTvOzQQqDEZawZh0byrDsNojTOhiRKzfd5rAFSt5Xad3mTxS+1xRnpSTusuWw7EjfQvboJq32A=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by PH0PR10MB5729.namprd10.prod.outlook.com (2603:10b6:510:146::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 15:27:47 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 15:27:47 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] dlibs: fix access to `major_names data
References: <SN7PR10MB6287FF4B1172CD80B733E84BC2B42@SN7PR10MB6287.namprd10.prod.outlook.com>
Emacs: well, why *shouldn't* you pay property taxes on your editor?
Date: Mon, 29 Jul 2024 16:27:40 +0100
In-Reply-To: <SN7PR10MB6287FF4B1172CD80B733E84BC2B42@SN7PR10MB6287.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Fri, 26 Jul 2024 15:35:49 -0400")
Message-ID: <87ikwousk3.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0139.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::18) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|PH0PR10MB5729:EE_
X-MS-Office365-Filtering-Correlation-Id: a21ac08d-6bbf-4e2f-5276-08dcafe2ffa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N2LOJdQFSIcKJhO936LnFt6n87LRNGaHFSvMCOCap6eM90lTnA+mGouFv2qy?=
 =?us-ascii?Q?7ZDef+KEaMCvSuAo30O2RBJ0EIGbjPHifuhO85qxjHZxEQogbFUDNcI2urmy?=
 =?us-ascii?Q?jb4DHv2oVTidt4IVsXY+bTPw/CoJxL7e3VQ3QkwghQAQfggVsEUYZDq9ZDR6?=
 =?us-ascii?Q?rykALYjbIo76pwz3yLES7huEp4y4sx03RdoDIG/BqGOXmkE1ymj8gLS44Dix?=
 =?us-ascii?Q?D1Xg7e5xwCu5WAwVhAcxNWqOInMTzTXDfdp6vu9fwQFl2/UbQxJMPcZ0VBN9?=
 =?us-ascii?Q?gHlD40ubM8Gd8ax5gpVC8tiyyHnds4BXvaVAJSSO0rmtOleJmEQ8Tqy6C5zi?=
 =?us-ascii?Q?KSztdEKm1KWEaTHnUEbr5DqxgG9EUNbVKIu6NT5ydjYnM4nf31FdE+PfPWNE?=
 =?us-ascii?Q?+G2M/mc0UnmGCia8IsrLdsGsaEr2fxfUpKCbDwTynrPRno9/Iy1Cuvu34qCR?=
 =?us-ascii?Q?RpSDy6P8StUSUZFq08tW/WU3nv+l5JsHeOWKl/5/M9xsmS/0hdjmYV1aigjf?=
 =?us-ascii?Q?xdy91Mzts4x39D/KyVheLGbpgZl+JVdY0jbta6EidN2G3bPOgsuODP0gRun4?=
 =?us-ascii?Q?YyciG5bZQ4J+tgo8fiP+Ky7mAb5IqaNnkqOwA0PsVQrJHVXMMNzXwSxHY61K?=
 =?us-ascii?Q?2yZsjPvp9pK33K0HOI/oAf+zeAaUFRfVrVwmghr9l/BrAW8NLFh78F4R5ARf?=
 =?us-ascii?Q?w6K/E2u6v2io2R7ZRhBdJfqWZdJfZJPSmiTthNAGjOxAPx+fJt/dG+ESUrFj?=
 =?us-ascii?Q?V+ivvv/BIlV7wBMqRB4aISlSf/DLjfGyi9yvgA6koh8jJgkBijg+aanz+bux?=
 =?us-ascii?Q?CL9HZLIjpuhyWN5MKIq2q5QV6aJlL4zGdxrSvwkONxrNBIWF1HxxhpthTD+h?=
 =?us-ascii?Q?kweKf7XFq+xmrG7Zre/ivYBup2f/Af1kKIIaklK4+eyzVMPeH7nUOEO11Mgj?=
 =?us-ascii?Q?RwQr0SoCRBGKafAETC3DfFNG1uRt5CynbskS7YU63U+llJMpPJXeJ27Goer4?=
 =?us-ascii?Q?d32D1RRxYOWCd/LerTgsb5HfUMbY3nbxVynJAMXkmd1J9f6gBD8NHVrBTtQ+?=
 =?us-ascii?Q?CtXPzV0oHgjNtrQl6a+/Ak8rux1h+MhnJDEX6XdvCWWWMU/WiF4Qenfqq9DX?=
 =?us-ascii?Q?jutGMeprZQUJwaWNkSkmmR/nU7MPZFwFT9xEGPJmF6N5f4XvSyb+n1EHnXZ6?=
 =?us-ascii?Q?jDt1YtJ28STFXclQ4wsSi0ljMYae9v8vUdaSj6g/lyan7bxCN7k5igFaeSVM?=
 =?us-ascii?Q?Pcp/tbeaVllC3R5iimc8RVRKbsqR3YL1bfZ5n3VFZNLD0oQof0b+0y3qGh3f?=
 =?us-ascii?Q?+ZC21yCzqRIHCQmRiHe0nUkC6Ykd5hLYZyguybz8yNfLJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WS1GgfFJY9L7hg3TYi9O0/DLBuHbE3zo8s17xALf8SXDBnNT5hMn6ctaXg5s?=
 =?us-ascii?Q?6+GHpmNi1qmb04w4AIDsCJnZTgZJp7husNB2tm/iJ/t2SVfZHtiLIZeCbob8?=
 =?us-ascii?Q?CvYeJaHI54wbrVjJUXd03FJO/fkrrBPSblToHUvliehaB8ZgRRpUI6VXLOgp?=
 =?us-ascii?Q?HgQ/NYDi09XPqHg1rGzi+4IU+ylEgTFHdsQrLcKmHaDanAoLhkYqsHyzmgnk?=
 =?us-ascii?Q?5yeC7A2ZgxwSRj4uJhWIlApfVFzLt4AgyLZ16KhsRYtKMEmejs8XY378n14j?=
 =?us-ascii?Q?MTmMv/6gObIgz02Jj7r4LiLCOsTHwoNbr4fbj1c1EjuRlIGPG/8irNUWAhrs?=
 =?us-ascii?Q?Ei1KGXORqpMOEHJoqKHO93ESGJ9iQ4ecW2BmDz0TPNZXOSjqHgy9J6NVak4b?=
 =?us-ascii?Q?X8e0UkyZCKRPkXkl89jH0VOPHnkdlYltxpGXBuhpnA5ATHvuGwEm5owW6DEz?=
 =?us-ascii?Q?31/+M0Ae1grw1mFRz3b0MMWz8QiXnduOhO7qMpD+5ZmIyLHJRAZdXIyApM0J?=
 =?us-ascii?Q?jN3v5Bqvbmeqcv2ptnNakzr+ZAgO+dXAuS1PfLME8fB8dx3MtRsocw9PoV/M?=
 =?us-ascii?Q?tm8/5u2t7ZbXeKRqkF+c0mMkE+swGqxTnnqrrIhThT9GqjZuAdZfEMtoJH3y?=
 =?us-ascii?Q?wy9qp3vRlMetvmJUpMYNpxOLRsAQmDtGATU5KCoK7Wwr0hko2aUVPZ2+B3zw?=
 =?us-ascii?Q?T8q8MvxIRKCsbHLI7Un9ns17Cd/7WeGq92+cM5cnC9T8BvVTPpv86iEq27rG?=
 =?us-ascii?Q?n5gG6s55PY7ZxbtWCNX5TD02iL7E6hrKaWBq2JoovQfSUukJ6aZchDKcFQbt?=
 =?us-ascii?Q?xL8cI1NpNu/dqbZwHSX4UNQ7RtVQew/K4FtDmv4hhOwGkgX6DtsiENPgry/a?=
 =?us-ascii?Q?WzkpIMCwXskCmYiOEEDW5c4cdPmvtHB7Ymni8KLPmh6k/wSN4cxcQgqpo120?=
 =?us-ascii?Q?KpqJ+cYHPD28fDekevo9SRhIVc/Hji22sfvzUTbwGjLnYstnGpieELbWUPCi?=
 =?us-ascii?Q?l5g6eok9HHCQHt3s/GlotU+yn+jXwwyhK3+Y81qwyrO60pcGcxldu213yHSP?=
 =?us-ascii?Q?9fIQ3m8vX4JfNnHwVT5dTdKGN0GiRqg6ui4Zt3Q9DRmOm91vck8Lkf8qU4l5?=
 =?us-ascii?Q?615axWKPKc3JetPg0bLEFeo9+ZW5WO2vrE96lFTer2OxHH6HXnHLJVhFgP4f?=
 =?us-ascii?Q?R1NBwA2g54N77HZEJbTR/0a5/AjdEAa4w984wmGILAsTjJne18Fyze0WY+OY?=
 =?us-ascii?Q?6wDs6QKrXI/Xet4bIQLp53aoSTOCygMLhJNDMlrd0mJIe8/4aNMY9A3aq1EN?=
 =?us-ascii?Q?9XJzPb72x1zK44NKghOrmJtj5YihzQiGRr410jS/HBabDT5RCFtPku0t5air?=
 =?us-ascii?Q?yb8nRRt7WjlRFpsahTTwuqsR9nSDI8yhnoCIPbJZr9NDpIE1ge1rfXm9jdRb?=
 =?us-ascii?Q?DzX3hokhDbBuBJCQ5KbY+4cNFLWFNCHb2fi0qIPnUnE5D9I5sceg+PFFa7e7?=
 =?us-ascii?Q?4FqsHHjKprLE6nrNOt2xM8bdgwK2cdJSvpVCKzWw/MpdvBWxgFjEhe87DICi?=
 =?us-ascii?Q?fNs5Sx6+m1x3+HrKTZ6yTBMKDLFlN3T3O27mfvehZao1Qk4kGXjXLbBAE2zm?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sgtmrvUkboJjmE9yIVJ775Mt4Vs2pELr3J5EnrqX7rnzc9wIzKOaufBEjBk/bsYox9lBRgzTDd8eQzGsMHQUx6SMcCUO1OF4DA/mRR0o7YJQrUS8dHbCxBgJKTbbZqKprYwy5WOPztGOBxh32SVbnwD3BibhmDf1OWjkW5AmsrIS5IY5x1mKKLhzv9RIFsUCw0ZPPDPT/72gStl22k6PeQLrz1gqWuNf+zlFET4zDZXoiuEhuaHHWXhI2bZFLO9MeinEV28RMwrAtw/DWumkbBi/28JcPVgnM6ViDk9SvYEjR38PT9xraCu/sqyt8Fw5nRuLQsgeg8yqPdEALkmKSV3AOS2R82Bip2JAvQuDV56A0Zotsx/Q+2hc01bdM94mPoeM3CI/lNRCjnb0t2SMfsktShxkuElRbDV2gx7M+GdpjCQl5tmtptWGfSdB2r0/o34CktFpFf364stZLbZnTiQ/dyCDiYCXxQKTbrezBPuob5ZibuQY2HPh3f3iFucA+ryIG8YI4bWpyLKULJy1jErAhw9j9SA0iNMX8CZQnG3vSLqYVm9UwrIxXrguHzHOYGKu1DfECFqg2pthFPLSMiWSWJr2aebAwslf0uBzMvo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a21ac08d-6bbf-4e2f-5276-08dcafe2ffa6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 15:27:46.9392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tgPmFPEvfToKbh2JIXxl5RbQqfxfC442/A4AHmobaP18bwQ52/fXIZcyHqOSYLLGfiTMFo02na11KlJoA9AYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5729
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_13,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407290103
X-Proofpoint-GUID: Ojh31lDewEWCBoukGNpqTx4km3Ov7dHW
X-Proofpoint-ORIG-GUID: Ojh31lDewEWCBoukGNpqTx4km3Ov7dHW

On 26 Jul 2024, Kris Van Hees outgrape:

> On systems that lack CTF data, all kernel variable have a default type of
> uintptr_t.  That means that an explicit &-operator needs to be applied
> is the kernel variable is e.g. the address of an array because it will not
> be recognized as a ref-type.
>
> Fix this for `major_names access in the io translators.

Ugh. Nasty, and presumably every *other* translator doing a stringof
might have this problem too. (But most are unaffected because they're
doing struct derefs or other things that need the types in scope
anyway.)

> diff --git a/dlibs/aarch64/5.11/io.d b/dlibs/aarch64/5.11/io.d
> index b1958418..c153d5a2 100644
> --- a/dlibs/aarch64/5.11/io.d
> +++ b/dlibs/aarch64/5.11/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>  	dev_instance = 0;
>  	dev_name = B->bi_disk == NULL
>  			? "nfs"
> -			: stringof(((struct blk_major_name **)`major_names)[
> +			: stringof(((struct blk_major_name **)&`major_names)[
>  					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->bd_dev) % 255
>  				   ]->name);
>  	dev_statname = B->bi_disk == NULL ? "nfs" :

I wish this wasn't necessary, and hope that in the future we can reverse
it, but at least it's minimally invasive:

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
