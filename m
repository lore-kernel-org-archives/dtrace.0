Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED5E155CB3
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187691; cv=fail; b=Xs95HjLWYrqmhs9sSn0zTXM66pryWv5y6Zz1qnPzyh54tFUvMPESsz4KN95I1Qyp2cogLPs1KmuYCBoi8oCTtf1eOj9lp4dSvNYQ08w/OEeLVEIuQnsjtde4xpkDKfO4aGAGiWravyfK2izSVVLydXysAmqWkAt8I6P/uvOyadU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187691; c=relaxed/simple;
	bh=WOMMbC8AUZQQium/gfq8CezpJxlS/xBsxRPFE/BOzyA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=Ad/g+cJnvrRONDxZU7jsAf3/VXxS5cvMF6MIfOGkDtfhqoG0fMxmuZ7XvMyNFmPMSEgHCO0yzlbLuVzXOmICn10JKUjXxR6n7Ns9ltRNI9AUogI4yF1II72hHc+xwJ8R94wcevl00X/lAiIlEF36bxOEU7u5TOQV1qz7cz2gZYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HM9Vp2Y7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Lg8p24Ro; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HM9Vp2Y7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Lg8p24Ro"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TCbN009185
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 12:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=mgqK+k+HPzkH6L0qs3
	Buv49+jRFqlmxV1s4kHD+ds/E=; b=HM9Vp2Y7GqZX68ND1PYS4kjnLN6Knw/6CB
	ybVbHVtpd1+v12MOCqEHFVT0cz7mxumk9vegADc9hFOsI28EH0Zcgwh9EMKTp7Rw
	EHRYOKUXxlAfVHkFKt9mSqbS8JcNCgJ4r8Tb9w/A5V4LpBqJkoDNxLcYpCwTF86+
	u/REjnrjM7ipr4h6+g92eSoOMP7xqPrw3pRCLSZYZrNbSaw5j+VsN0BPuHH6Iyz/
	KvYhwcNjlM+6noDDpWlZoRasX2muI9DT1LED8cNoRG3+FA/5vc1y+IrF4XZ4fBnJ
	BQdebgzj6gND+vGou3erWkguoKSySLb5uztd2FeL6OUyIkVr8qNQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805tx57q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 12:34:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MAcAZJ005975
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 12:34:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t992vw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 12:34:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InYEmwwpYKr0BybN8mA2TM6y3xZ/ZrwauJJFyVja5Fus8Zsw/kML35U4hsllq2aGm56rrpezJTp9en/B8SxPwWueRTQAbR06zZLaZARKIuDnPAIxac6zveNMnODJPKeH461kTEtKcvIsTtqkwvNBG1AchYNSQnURlEGU6rzl2pYCl96IsaaPQ4nqVQRmDXdaCG6oiXxOfHWuEMTK9JiMqYMa2K2/l5BujVft9D6G2KKIN6IlDiMAD7Bkcq1xTBGwWgF7qX1msf/Auf+0zi09ut25no60qoRNuwQiHtsMj8kNIt7AMY9PmG7OwG5XxT/S4p8utCT1NzRce05qr1Acmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgqK+k+HPzkH6L0qs3Buv49+jRFqlmxV1s4kHD+ds/E=;
 b=jTRpllBHLFDlTJAhvbZB9IdtphmsG1YgB2XHCzm+dyO7Er30QSQxlA8tVrzkzVO/1pF1md9hjWp2LEnduRn0ODsjp5qc3dOu+ikorZMMWJ1zCsbvE5o83vCzE59N078pMfiTK+6ExNjiza5qP1vLBKL8YRJrYFFYS47XgfXhHWBRfIm4PnNC9Le1P4tBrFil8ZIZgEg1McqC5e9WDsNpbE1Ct8tlYxr4tutHBmth/kocth/ZEDHq3UrdZonESxRqkUVyLNB9WYLadfefjodKExmoB2Jdkm+bVM7niI9VpG8LOC6CN/NkTgf+xV+/27C02l7yutFAy98hhbaHRCTZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgqK+k+HPzkH6L0qs3Buv49+jRFqlmxV1s4kHD+ds/E=;
 b=Lg8p24Roa7FtJFPxxfAqDZA57yZkIzUISUysZewBd7VgIdDPFyBRbd971A2s9RVF/cpCecTMQ/xqhgU7N6TlZX2TRUyk+7TaxbdiE4+mXeOX3HEt/UCjamkFVFvKES3fkT8A8KAp8Kj+/Lz7ibgZFMrN5Bfjtor9Rq8HOJ9HNys=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by MN6PR10MB7997.namprd10.prod.outlook.com (2603:10b6:208:500::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Tue, 22 Jul
 2025 12:34:44 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 22 Jul 2025
 12:34:43 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 2/2] Extend the USDT bit mask to multiple words
References: <20250625060305.15707-1-eugene.loh@oracle.com>
	<20250625060305.15707-4-eugene.loh@oracle.com>
Emacs: because extension languages should come with the editor built in.
Date: Tue, 22 Jul 2025 13:34:37 +0100
In-Reply-To: <20250625060305.15707-4-eugene.loh@oracle.com> (eugene loh's
	message of "Wed, 25 Jun 2025 02:03:04 -0400")
Message-ID: <87ms8w5rqa.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0312.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::36) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|MN6PR10MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e58e2dc-4d6b-44a1-9e27-08ddc91c225d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y/rCv72P4XQuAZ4apMywDT5lvErkUdAY6mQAlO5QGID9P6pmZW8KB48tZBr1?=
 =?us-ascii?Q?NTSrBP+wypMe0EgDKTbqrOMdgmBuJS6qZuqxR+Xnb4lUQnDNkEcCk9SBhJ0X?=
 =?us-ascii?Q?SA1mqzm0AC/Ss9ZdpA3Qff0uEV7O5TBfWmsPU81l2kr9e3y3yb0diJ9jniGp?=
 =?us-ascii?Q?XDLZQlX3qpYtTa6atEhOjCORt4/MEItjfkm5eTRcOHWeTMSHxBE7MnI2Rq2T?=
 =?us-ascii?Q?M8KkoS0ga4LULTe0R17zXxGmBBwAv4YIBLMC2MwNU0S1ATkyU0Zg470TPEX0?=
 =?us-ascii?Q?atCkP86Nt+5h0k/4OzmqM9sEIWzvlgrJpRXyb+2MH9j+EOdTJF9IwmlGqS6l?=
 =?us-ascii?Q?NyXPLIOfu1KbALZbLrtNmHWIO8OsycYrCvKad96+lEuCG1MKlqy1marqrW8R?=
 =?us-ascii?Q?1T6waCq3lRM0EPXBod7jBYuGucfVvXQd7tpBOpxZlJuGG0AGOv7wevhcKEJE?=
 =?us-ascii?Q?WAL4SQ5XijNlIezIaaRkaH/8FnTY/jiwKd0mexX7fPdn7BfroPzVzBZ7BMCl?=
 =?us-ascii?Q?fynIfhIk0qztXfdcQv2+6rZiBBaKQmIkl10+ii3rnqA3rCdqJSeNnUtPOIeY?=
 =?us-ascii?Q?GT/R1t0VtPzDdhz87cZduw27wbQghNEZPhah8iiBZhvHuzIEhDW/qs8XJY1r?=
 =?us-ascii?Q?L+LWm+9Pzx4Tanqoblj1qpGcTx4CAuZD9aUaOPcDzQQaR7XzoAUseC/ig+h2?=
 =?us-ascii?Q?pHcOlrgUnhqvNstJ0wF/+vIPlIls/aykUq040gOHk+D2+NdILOJDqD+sgrWI?=
 =?us-ascii?Q?B33cRBSw4rqx43O0EtpaNKms+0/waFN0m2JxIJ8WoZyixFaQ7CoPWSqRP+S9?=
 =?us-ascii?Q?Vg0NB4bBrGIdMYQXrJsBGsxVXTYEAziM9kADonnmEVGOKe0LZX4y/fxVlagy?=
 =?us-ascii?Q?X1012ObOjri9QpdKYG5DHnKZ2u8bRgQ0BjvcrtR6HEBUjQ5gTIRCftChGhH5?=
 =?us-ascii?Q?+EObN20haSx3+hnJKTBhI8Pe5hpKHqZsNu1o0cM8azlQSHGh4PVqI63if1bC?=
 =?us-ascii?Q?hOGqWLQczLJwtIB70t4aLuMq7xuaGyQ0epHsZR7Rx6toMqGUYAfjpw8Icniv?=
 =?us-ascii?Q?E6Dguv+GUKhm3GrRPCa5KVvC8y9u32I+xF9RFVlGi+lLA9AKRoPYfmyUIZLu?=
 =?us-ascii?Q?q09BFQGyJGz/yVJHtLyEmp89hCS7hTI62CJb6HEnFRVHOanV3yUHrOF5KaSb?=
 =?us-ascii?Q?BIyhiwm3h5KM3UJxSjMy5KsWbRyOc3AafrCZARUi0HSoXA3cAxz9hMt6TesD?=
 =?us-ascii?Q?dFGZA6q/nO3fZu/0iG+6ghhXS9TQB5mNQ9aMXqmnhax1QBydxDEmjmGkV0/M?=
 =?us-ascii?Q?usmrdRINUht8JWuVqWQnNkjf/YQHPvyjkh+cjI3Xt3Uszoj3qm7ssw9atf/L?=
 =?us-ascii?Q?5U/qD1DYEQX237fwhsemNwGpuWDsZ97smS9x+UWVCB7f+EWNfpjCh0mDIGvb?=
 =?us-ascii?Q?mMihW2y+8ZQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j9o3O9iq4psUrFjrChOTTKiCz7pZ887lSBSs6UtSUc9ok/KLIsGzQCVOVN3Q?=
 =?us-ascii?Q?1HT9PC/hfeRIGoxHhEaCqS+88Qspes9ygh53TeS8ICxKJr5ZWFCRRJD3Ws6X?=
 =?us-ascii?Q?jjQO9uI+B2eQkbU3MuyYIdm+MadHF7z6r3cBBO/CnipAFnpkrgScJ2JFqiXG?=
 =?us-ascii?Q?qx61So5hHtiHyLcIzfOvRWxW4VP1HklXbpkqiiirwYZxHNoTzO/+IWCuvGHx?=
 =?us-ascii?Q?FdSre010Czn07i+dRmSltJ1rzg6XLLsiMesrPB+04qepKiIg46u+kgdDy5Tw?=
 =?us-ascii?Q?jGRzm7weVGjSd8wRLeuVbiEu3GVUl01k9pfFsdiNJ3GdiVQWHcyDKL0Gn5LI?=
 =?us-ascii?Q?vLmiahsyklRk59TAzOSVjn2PyuATYbPoM1lUlyoHpnFj2vbMcG241mWhnCGy?=
 =?us-ascii?Q?SnXnEVao2yKnCrc6HXe8xeGFjPh9Pi2OUA8Nw4F+5rUjjwjLdk9z4yQSk9sb?=
 =?us-ascii?Q?CMIZyUkGbZ42D8DP2MjIl8XyakIhqeT56pHY/B+fSe1FK2o0K4AiZYq0Z9li?=
 =?us-ascii?Q?8vbFmsY3wDFc8rkV+CMGPOI9tyLpucoC66beFmhdZnPQYog1uVIVovwD09Xf?=
 =?us-ascii?Q?BAT7UDbNaL6Cx9jzKvew36S1vITL6lh2pBpF69kz5sRrrqUm1RtJA4KNp/xJ?=
 =?us-ascii?Q?75i+5DgJwuBrNJlNleeMoNRJRO2iudmFDJN0dr8UThoj1Hm9Q8zBuuIgg5nU?=
 =?us-ascii?Q?H0XLVboiT+GbElPbFRfoLZnZ5i+z3u/mhxHvOflRyZXRfI9GRCc4p3PzkNqb?=
 =?us-ascii?Q?CSs7TNfyYTIFwrl3NZnywzPClfNrQMehp1PemUXhDdsiOMZS2aPJVM0UYlSl?=
 =?us-ascii?Q?5jt9y6YYntSRzcQROWfRYlcT/kQDNvnbovV1p3Gppkh2JhZmgItrqcVvwYNi?=
 =?us-ascii?Q?Qt4rcb6Y/icYVwXyB5K/S2bZfG6Nb7LpDwGMsgERxEEzmNZMmTfVyC+5pgmj?=
 =?us-ascii?Q?Lwj61P3tABqxWRWJvGdJ1k9F4LQTd0oQd6T5tjIMqDNkQIGKIEshyYYwWiL8?=
 =?us-ascii?Q?NtaqDNkm+wA0ya0/gWEjvEDUGTsFkzIx2g4chumDUXDSDyAhU2ZeKOMy8cnM?=
 =?us-ascii?Q?/k9aePhF6Zbs5VCWvS3xF+YpjAxNsWqcQfc9W/8M80f9mnb3T0UXT3JrQCx9?=
 =?us-ascii?Q?fSyj7La4kgUFzkOrTPTzuzkN6DDCjdRK7kP6zivfRX2no89VbicWYSur9Uyu?=
 =?us-ascii?Q?jWcXB7OQ+nzkU3shKBl7VE1Bl/gNpFpAI8iQlTTDpyP52D5mkySYeES4+iTb?=
 =?us-ascii?Q?oEOCIlHFDg4rD0FMUTNoffwamm21dWhrc3NAQkLvAx/IOkhRNpCWlgDXyU4A?=
 =?us-ascii?Q?5o27gSPkJnRrb2zaSl9120XrAsA4G9FxSNGb04LRk9U/esJGiErhA2IHMmCk?=
 =?us-ascii?Q?0cCFlwuvLU9YnQEvCFdrV76JXHEePoA/nzx82oIXepG7HFWhEyOZ6TIFHkZe?=
 =?us-ascii?Q?PaDuVigB3FyFOr7Jy24TcjozqcYffLJfyI2dlGRWM8aN5vKC/Tt74oiGyIj/?=
 =?us-ascii?Q?myqjb6OOeMYvDR4FabUiPZBi96JFj6BPvQx2bVVbkvaIwYxAhRHOwZAypMuE?=
 =?us-ascii?Q?WrmR+Xf5B99d/D5IlKQDWeLdqbhnF40WcpAceFel10kSkceYR5pTych6eQIT?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M4StKlFnwaBQ7ZryDLa9KtkaELMSgEs7kyh1ulD+NM22S0RJt4t2C6wQHN5w82Da3QpmJx0BqbjemgrK+Y01kdDmPr5WGxzSl0pY8ry6syjgv0vyVcE8Uj67dNosQyVssWCpDk9bDyG7k4XdqaywrxNZzUAl8VTXxodkC9J+JtVCkxJEKgRS8ZhT/MHTp48I8wGiO5BSWWcqsbg4X56WsKCkXv2AHkxWCHd3+mzVe7P9HnCEBgPPLzt0l8oKQ+iXjYsROaJnPKHSdWl6deEFiJm2hqRR7Me++dejvW1jUQSsDFoc/+cIX8dRLh348ewQSoflqO95OwU8wKm2KguOFG9OQ96bkQ9d8llhwbL4Yc1FEU+TVbDd5spM2nfuyi1FE2Rv9J5qptbU3XDKySwzkEDIhuHeOXVabMJzwBhWpt36xuHR8BLDtSgByPdy8SC6ns3jYdhQPTc2A6qg9WZvmlq5ulAkZS3f6GkavAgV3iWTwQDj7b/PVvnVkKiBjLS630d79tZRvd1VWtL10dEnKVuzIn/HTjtAsea0GIdDTygUropniMLQIHKzZeuuUMM4vckSiXXHwdvePi/xiewa3epFnJPx74toElaplX4RGhQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e58e2dc-4d6b-44a1-9e27-08ddc91c225d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:34:43.1955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJo9s9scjdDhQII6I6DUsW3xAm2mpDj7hF1cVHTQ723p00/KmsVS8DyiLywv/TyzbA80EEzJ3VEPxKeEsbTP4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7997
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507220103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEwMyBTYWx0ZWRfXx4U3GuInz2Zu
 2uEIhM9bbckfWcrLwJEzw/iRrtZD8P23+0SxFDhOWg3rOPMsbqZNSR9MW5i6It3aOMVYZAxzLXG
 QHrXV8ZffqKiBv1nBHEiGvlDzlgQtdP6F5NVVDfSbxpsKpVIFrxSdD9E/9nRyvwXdSloHfzV4y/
 pO/XyRcmGKLrcVn6kOOpUlvkYDZET5en+mBsERSsX5dVMA3Fz8AvPxF+HCloeFCvQ86s0OXht3K
 st0q7eeR7wS4x+CJRCCLas87Fscoq9Ewjzajorj4hhNf10XrkFOK39iyYkBE9RhmsalRqRnZ/bz
 EOOUiIwHazdcN0fOnJzWBYSdwRwLGVJ1ydSsI4N9ajWY53AgM8No7hrSK7n7ybAzxL7DiyeKooK
 /e4su4NwujwSlXeApEhIbZx7iwhFl5XeGTPrfZUIGRQIC+AFa0cH2vIwpsHjK6Ev7lFSIGUP
X-Proofpoint-GUID: hoABoPTHEpfw-ldwsZB3b8dARHBaYFIx
X-Authority-Analysis: v=2.4 cv=IsYecK/g c=1 sm=1 tr=0 ts=687f8567 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=S9IeJNpOkxc-QlVkDqIA:9
X-Proofpoint-ORIG-GUID: hoABoPTHEpfw-ldwsZB3b8dARHBaYFIx

On 25 Jun 2025, eugene loh outgrape:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Currently, USDT is limited to 64 probe descriptions since the
> underlying probe uses a 64-bit mask to decide which probes to execute.
>
> Change to a multi-word bit mask that can be extended to however many
> probe descriptions there are.

Oh yeah!!!!

Not quite happy enough with this one to r-b it, but it's sooo close...
:)

> Also, change the mask words to be 32-bit rather than 64-bit.  The reason
> is that, commonly, there will be fewer than 32 probe descriptions.  In
> this case, we shorten the value of the "USDT prids" BPF map from 16 bytes
>         uint32_t        prid;
>         long long       mask[1];
> down to 8 bytes
>         uint32_t        prid;
>         uint32_t        mask[1];
> (The second member is smaller and no longer costs extra padding.)

Nice!

> We also add an
>         extern int usdt_prids_map_val_extra_bytes;
> to denote how many extra bytes will be needed for the extended mask.

Ugh. Is this really the best we can do? A global variable referenced via
extern? Can't we put it in the dtp or anything? This will fail as soon
as we have more than one dtrace handle... and yes I now that's not
exactly tested and probably doesn't work, but we shouldn't break it
worse when keeping it working as well as it is now is so simple.

> @@ -48,8 +48,9 @@ typedef struct usdt_prids_map_key {
>  } usdt_prids_map_key_t;
>  typedef struct usdt_prids_map_val {
>  	uint32_t	prid;		/* should be dtrace_id_t, sys/dtrace_types.h */
> -	long long	mask;
> +	uint32_t	mask[1];
>  } usdt_prids_map_val_t;
> +extern int usdt_prids_map_val_extra_bytes;

Note that this is not how you're supposed to implement VLAs: [1] is
extremely obsolete (as in, pre-C99) and very deprecated at this point.
[] is the recommended approach, if you can live with its restrictions
(and I think we can here: all we need to do is remove the extra in
extra_bytes and *always* allocate at least one byte, which actually
simplifies the code in usdt_prids_map_val_extra_bytes(). [] does include
the size of necessary padding: mask will start at precisely
sizeof(usdt_prids_map_val_t).)

> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 5ba50b678..65413cba6 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -303,6 +303,8 @@ typedef struct list_key {
>  	usdt_prids_map_key_t	key;
>  } list_key_t;
>  
> +int usdt_prids_map_val_extra_bytes;

Ugh!

>  static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> @@ -403,7 +405,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
>  	int			fdprids = dtp->dt_usdt_pridsmap_fd;
>  	int			fdnames = dtp->dt_usdt_namesmap_fd;
>  	usdt_prids_map_key_t	key, nxt;
> -	usdt_prids_map_val_t	val;
> +	usdt_prids_map_val_t	*val = alloca(sizeof(usdt_prids_map_val_t) + usdt_prids_map_val_extra_bytes);

(this bit will need changing slightly if you use [].)

>  
> +void usdt_prids_map_val_extra_bytes_init(dtrace_hdl_t *dtp) {

Wrongly-placed {.

> +	int i, n = 0, w = sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
> +
> +	/* Count how many statements cannot be ignored, regardless of uprp. */
> +	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
> +		dtrace_stmtdesc_t *stp;
> +
> +		stp = dtp->dt_stmts[i];
> +		if (stp == NULL || ignore_clause(dtp, i, NULL))
> +			continue;

I was about to complain about the cost of all these ignore_clause()s,
but of course this is only invoked once per run...

> +		n++;
> +	}
> +
> +	/* Determine how many bytes are needed for this many bits. */
> +	n = (n + CHAR_BIT - 1) / CHAR_BIT;
> +
> +	/* Determine how many words are needed for this many bytes. */
> +	n = (n + w - 1) / w;

Thank God you commented this -- it took me ages to realise how it works.
It feels like it should be a standard idiom, but I've never encountered
it before...

> +	/* Determine how many extra bytes are needed. */
> +	if (n > 1)
> +		usdt_prids_map_val_extra_bytes = (n - 1) * w;
> +	else
> +		usdt_prids_map_val_extra_bytes = 0;

If you use a [] array, this can simply become

usdt_prids_map_val_bytes = n * w;

> +}
> +
>  static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  {
>  	dtrace_difo_t   *dp;
> @@ -650,6 +679,7 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  	int				fd = dtp->dt_usdt_namesmap_fd;
>  	pid_t				pid;
>  	list_probe_t			*pup;
> +	usdt_prids_map_val_t		*val;
>  
>  	/* Add probe name elements to usdt_names map. */
>  	p = probnam;
> @@ -685,11 +715,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  	}
>  
>  	/* Add prid and bit mask to usdt_prids map. */
> +	val = alloca(sizeof(usdt_prids_map_val_t) + usdt_prids_map_val_extra_bytes);
>  	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
>  		dt_probe_t		*uprp = pup->probe;
> -		long long		mask = 0, bit = 1;
> +		uint32_t		iword = 0, mask = 0, bit = 1;
>  		usdt_prids_map_key_t	key;
> -		usdt_prids_map_val_t	val;
>  		dt_uprobe_t		*upp = uprp->prv_data;
>  
>  		/*
> @@ -707,11 +737,15 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  				dtrace_stmtdesc_t *stp;
>  
>  				stp = dtp->dt_stmts[n];
> -				if (stp == NULL)
> +				if (stp == NULL || ignore_clause(dtp, n, uprp))
>  					continue;
>  
> -				if (ignore_clause(dtp, n, uprp))
> -					continue;
> +				if (bit == 0) {
> +					val->mask[iword] = mask;
> +					mask = 0;
> +					iword++;
> +					bit = 1;
> +				}
>  
>  				if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
>  				    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
> @@ -726,11 +760,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  		key.pid = pid;
>  		key.uprid = uprp->desc->id;
>  
> -		val.prid = prp->desc->id;
> -		val.mask = mask;
> +		val->prid = prp->desc->id;
> +		val->mask[iword] = mask;
>
>  		// FIXME Check return value, but how should errors be handled?
> -		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
> +		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, val);
>  	}

... am I missing something, or do you never modify "mask" (the local
variable) anywhere in this function? So it ends up always zero...

> @@ -1451,7 +1485,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	const list_probe_t	*pop;
>  	uint_t			lbl_exit = pcb->pcb_exitlbl;
>  	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
> -	int			n;
> +	int			n, ibit, w = CHAR_BIT * sizeof(((usdt_prids_map_val_t *)0)->mask[0]);

We could really do with better variable names than "n" and "w". w seems
to be the bit-width of a single word: word_width? width?

> @@ -1538,7 +1572,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	 */
>  	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
>  	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
> -	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
> +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP,
> +		   DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
>  	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
>  	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
>  	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> @@ -1572,8 +1607,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
>  	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
>  
> -	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
> -	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
> +	/* Store the value key for reuse. */
> +	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));

This all makes sense...

> @@ -1587,21 +1622,24 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	/*
>  	 * Hold the bit mask in %r6 between clause calls.
>  	 */
> -	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
> +	for (ibit = n = 0; n < dtp->dt_stmt_nextid; n++) {
>  		dtrace_stmtdesc_t *stp;
>  		dt_ident_t	*idp;
>  		uint_t		lbl_next;
>  
>  		stp = dtp->dt_stmts[n];
> -		if (stp == NULL)
> -			continue;
> -
> -		if (ignore_clause(dtp, n, uprp))
> +		if (stp == NULL || ignore_clause(dtp, n, uprp))
>  			continue;
>  
>  		idp = stp->dtsd_clause;
>  		lbl_next = dt_irlist_label(dlp);

... as does this (although we are now calling ignore_clause() at least
twice for every clause, I think three times)...

> +		/* Load the next word of the bit mask into %r6. */
> +		if (ibit % w == 0) {
> +			emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
> +			emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask[ibit / w])));

ok, so this uses the 'w' thing to get an array offset out of a bit
count, and then you can just use the existing repated-shift code. Should
work.

> +		}
> +
>  		/* If the lowest %r6 bit is 0, skip over this clause. */
>  		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
>  		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
> @@ -1629,6 +1667,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  
>  		/* Right-shift %r6. */
>  		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
> +		ibit++;

... so, this isn't in the loop conditionl because the values are only
filled for non-ignored, non-NULL statements. This assumption is
duplicated in two places (here and in usdt_prids_map_val_extra_bytes())
and if it ever drifts we get uninitialized rubbish or buffer overruns.
Should it be centralized somewhere, somehow? At least it needs a
comment.

> +# We stick 80 probe descriptions in each of 3 scripts to test
> +# USDT's ability to handle hundreds of probe descriptions.

> +++ b/test/unittest/usdt/tst.manyprobedescriptions2.sh

... maybe manyprobedescriptions-bytesize.sh :)

> @@ -0,0 +1,127 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# This test uses many probes and probe descriptions.  Therefore, the
> +# number of BPF programs to load into the kernel -- dt_bpf_load_prog()
> +# calling prp->prov->impl->load_prog(), which is dt_bpf_prog_load() --
> +# and the duration of each load are both increasing.
> +# @@timeout: 400
> +
> +dtrace=$1
> +
> +DIRNAME="$tmpdir/usdt-many_probe_descriptions2.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Set the lists.
> +# - The probes will be foo$x$y.
> +# - The probe descriptions will be foo$x* and foo*$y, for each $d.
> +# So if there are nx items in xlist, ny in ylist, and nd in dlist,
> +# - there will be roughly nx*ny probes
> +# - there will be roughly (nx+ny)*nd probe descriptions
> +
> +xlist="a b c d e f g h i j k l m"
> +ylist="n o p q r s t u v w x y z"
> +dlist="0 1 2 3 4 5 6 7 8"

... and with 8... maybe we should also test 0, 1, 7 and 9, checking all
the boundary conditions (and refactor things so we don't need to copy
all of this every time).

(You'll only really see things go wrong under valgrind, but that's fine,
valgrinding should be routine before releases anyway.)

-- 
NULL && (void)
