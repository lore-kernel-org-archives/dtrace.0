Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF38B267B12
	for <dtrace@lists.linux.dev>; Mon,  7 Jul 2025 19:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918134; cv=fail; b=VT0hRmRKtkqH+En3ajQyhFjCa+MkhflSnFvt2byXSh7fWz98vbh6jDAZLQrMj4S4Ix1YfuOXKSWMiKK637sn57If4ix//bTVWt5FtLNY//qbgi4MXFeuzlyfajpBEjBOclEfRlYrhSBlOgXyxrvXWyP3sAT4lDlurlKVtCIe8rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918134; c=relaxed/simple;
	bh=TEZ6l/AUZGn7eZRYyc8KfUx5+dAatiK+sxoWoXzVLUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rz3WZjdPE8sd/l8QWNJFcMieoKWXL0XEDRWQaF6Eg4krwjNTGAOWWl87q05YiRKgBUJSL7TwdpWPqSI/sW16X9uMj/U17Cy0BbIMYGGxd8sCLPhkf/UtT4y0qI3Lp/uBsj98zIMHTweAxLbdo4BInVvDNGD7GrnhF8LycKqx2Ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X54oqCLF; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xkHtD2+0 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X54oqCLF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xkHtD2+0"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567Gql7r005473
	for <dtrace@lists.linux.dev>; Mon, 7 Jul 2025 19:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=sm/lYL8olXdDISmT8nx7pAlWgNmLqNU62v05dGwDobU=; b=
	X54oqCLFMOje9tTUm8/qEh6XgqUI0t2DoqdeiZw3yT1aG39qfWwd0zR0pIctoQt6
	N63z3xHdui1FvurmTE88PtF7pOGc8eqwh8DNNKQnoaGTwBBh5bnrNu+oUh6ERtlT
	S2ifjjzve2dsx8jZGGmujbWHdH9m8L7XQ4OBNCyroA+3MfZLYlLxNOiQWPkKxqNF
	fAcCs/dJdiIUKyGHd2FCTpUyQn8vsfp51LsgXoyEDBuKCu74DiiN9YFOrULY0Zhj
	fGO3rivgcxH2RZQWHcjMUSDRkB3XloQeAuX5YuOZzcmKQnNya+KHeGE9r0ljif7R
	ouF24+lYxHipE6t4cHMjjQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47rj4nggpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Jul 2025 19:55:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 567Jnvki040590
	for <dtrace@lists.linux.dev>; Mon, 7 Jul 2025 19:55:28 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2059.outbound.protection.outlook.com [40.107.96.59])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg8yk1g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Jul 2025 19:55:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gty3HMrQpHXIggswWPl4BoTxCs/5JC7i9jjbeTQ2jOwK2da3qDz8XNyl/COPxWK3CEywKj3blaAcT7dFXUtazUwCQZiCN1tgPCadFvugMOBVbdWMloo3ojjA5rf86HAMwXpA3Xknm7SoKDM2/QnN/q7w0iMTM06E9SDmNsWr/BOySUxraf5TC/7RDNH87/7RWX1hi5zYB9kH4zqfrjKTzGNCPOtcaA+bY5VHRPDN4JVTcAiZ/SDH5pSmz1tZL0ah9cfAGm7nb4/qRX2m2h2qkrq1md4eJw0E8afGnQK9NAbaBFfMG1zbgTjvvdv9u09HzRPk7q9HoIuXcgYVK5BioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyPcrGeggPA4JMNX2+EMRrEwemG5FqE0QZVJYcA7Qso=;
 b=l6Upcm+2G3IR0yt2E4D9G9/wTE/UVtLigme3VuyWsqNUVBt6HaObpHxrIBxHes8A2qCzjoW97yLb96Rr+spQ/YIgv8rfE3djJpx/GMttsRHlCMBOOfvLVvPoA+8cCbM5yyP8Tc+rKm+e6uPDd4ltqlD2jelvlqyblII1gCHcNUnCrR3sC6Wf16v/b5jKJta2xPOP8gMZQcobc1l2UK4ASIRAGTwCRS6a7i7C02DU5f3X6PYnqFwaFS2idVAqungBzf2A8yVRmGK6dyRhCLOO9vX6nbTGQLCk0vIu+onIKBOJvinvtFdn/Bm3XAFqGVOEQzuR0GoR2HlfMPz1+281Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyPcrGeggPA4JMNX2+EMRrEwemG5FqE0QZVJYcA7Qso=;
 b=xkHtD2+0mUFvDk/qz8gXBLRH1t1IunIutehO7dN6rt2r0wSugfTykMALV/L5GlKb6LsfW/35Ec/MD6jELvfOyBqSM5k6m4+tjha91azs656EXMeHuhFWhRhe/89hzCMGVOq0ZMS12mc1L0Jr5BN82VhxNcgEaDnMQlLrJ8QKmIk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA6PR10MB8157.namprd10.prod.outlook.com (2603:10b6:806:438::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 19:55:25 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Mon, 7 Jul 2025
 19:55:25 +0000
Date: Mon, 7 Jul 2025 15:55:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
Message-ID: <aGwmKfOPU+NZ+ekf@oracle.com>
References: <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
 <aGbLTOzqILN+3J93@oracle.com>
 <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
 <aGbT+p0DjRTFl7Oc@oracle.com>
 <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
 <aGbvQAmqsLA5+LaH@oracle.com>
 <aGcF67vQ8M942gh0@oracle.com>
 <21b12943-a166-41f4-8f30-8bb44e12317a@oracle.com>
 <aGv7kQqlPZt6Kmw6@oracle.com>
 <d74b40a6-0834-4edb-8cf9-dac28500a7cb@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d74b40a6-0834-4edb-8cf9-dac28500a7cb@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA6PR10MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 6957e532-d3ac-40ff-a250-08ddbd9036ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?vVBj3prFCO/2CE7z2HJxFKhDFO00r/f/jjRgVYykUSnAsyCrrSaCRi+zab?=
 =?iso-8859-1?Q?pG44Cfhotrb8lUTYs/t9xq2go5OLTP5QQyzhGltaER7XqJzSb8CXnVn+ME?=
 =?iso-8859-1?Q?2xx6UuNGONAaX3a57svjO0KBrK75N5oexJ/ovEeCf87wvibKIqJ0cNFgBq?=
 =?iso-8859-1?Q?bleIv3i4UlXUPZ1pXH9K+UbZafrWUpzDVNr559R5cYJPg+JOHRcAzynOzo?=
 =?iso-8859-1?Q?u2ydN5Vb7EwPmarKkRDMQZj3zrn8RgMJHFXHDr8/t21vjViFXdulcGIfZP?=
 =?iso-8859-1?Q?sJ09nnhaw6vPPQ+kwQqQAdoWGStDeEUGzeYGjgqeDHz97YoDMHSM3XGy56?=
 =?iso-8859-1?Q?rpF1VNoDA9dfmMALv0px/NRFvR224aDOY8zoPhfrylrnp9cI2epYNek3b+?=
 =?iso-8859-1?Q?pFMZ4cbOzaLdsO87wZNpS2+9FCCYUm8HCoVyRUFF6stu8cuO5gkONk8Yos?=
 =?iso-8859-1?Q?Lm4O4GtOPjK5g2zOFFVy/7snWvPyV5Dy1Y16A8DT7c+oaKvfazwHAxpQSN?=
 =?iso-8859-1?Q?RppAtZB+1b6uBWLviuM3Jvy0GFDVMnmtFLGTIeyRmNbhUF8vasvoS0x180?=
 =?iso-8859-1?Q?Hz0HcrJdATYTaJ9vXLqCNoF66trqzlUWdMsOHLzDbJVZyUXfNCW4SYY5X9?=
 =?iso-8859-1?Q?CgerDYC4ZECvf6GkLjQo7xkLJ4PglPzbI9wqWy2KlJx8NTSSXTK5ItaGXC?=
 =?iso-8859-1?Q?QOS4DoZMnrVIZpNITMnRUa9CmVnWVY1fz2P5cFwnuelEsN+ekp2n+a1Ik5?=
 =?iso-8859-1?Q?fPLKRCPlh/uuXHxRbQHMh5T3p7xT1Gs0utxy+ESx6WG/bwZ3y0wd39acDR?=
 =?iso-8859-1?Q?0soWMOLd/7pCW5KoCQvVmErYqLoGniJVdsJo6Jp1DAWttIWL/IUwmAN6to?=
 =?iso-8859-1?Q?6m9aIxq/zRFd0EOsK8rkLUiDWyArRYvJFDCJPxGSqwLDZyAgVEX88T4/Sh?=
 =?iso-8859-1?Q?iMMDtxDNuYC8eGJLq/KmDMZMUqhd4ckqsN8mOfAOAK4YsryEUggXtjg9Ww?=
 =?iso-8859-1?Q?0FZiISk4AozZuSrXrwepJthU+JUO8wKmYBmLeiwQiPmzcH6sewUqQhWUUI?=
 =?iso-8859-1?Q?U8TWlmnmrQCWD/ua/RsxOZgZ+w+TVrpvKsjYv6nF/xlMguFS7PQ+oIT3tx?=
 =?iso-8859-1?Q?BfFw8fmGq8sJnIDq0CzZMn+kQeDH9iJVY+E4ZDUGLF9JZDaEs6EU0KaC6m?=
 =?iso-8859-1?Q?ltpFxKBezmiWl+RnTnT+lmnIaSY0ljCB6NqDQs9/q66syEE0xZi7ivxjQ6?=
 =?iso-8859-1?Q?OSyuE7RoGMOkLIuuUfMG1NYhPA2YKAnsN9PZ7iE/1ow02kFj73G0KFyVmz?=
 =?iso-8859-1?Q?Y4WdocF8bKAf3ueJ8V5UCdRVVPRbgnigEU15fGN1IZqplnKdad2D4DfAzq?=
 =?iso-8859-1?Q?1X5ITWwvl+6fp7GNe8E02TLU7I3rH8tPquvMsmHVmlpGYtXUziAE4bJoEJ?=
 =?iso-8859-1?Q?xtHFmw9giwZkr83CBEG0OhhugEtHcDYeWG34NjZujPIFOngjeT3Nl6tFnm?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Sqd/9CsPfAwlHhsURmpN9jKVfgJ6zFl+Jd0r2xPFlhXGH7nOfyC6Xg4l8K?=
 =?iso-8859-1?Q?40I5G3DSzRGGAfuPW9EuGo5MQTtPpJCPlgBrY17VzuFoymEzyAcxDd6MWO?=
 =?iso-8859-1?Q?ML/SqTqL2nqHKV5liAgvsVIAzun5xKEVzHMsNR55vEDoq5Z2zQ6M2rYshu?=
 =?iso-8859-1?Q?t8GS28hD9Hm6wYBgFe5kiL6jFDR04H3q4JJ7eWkmaHH9Y/EdmGH+6oIQAB?=
 =?iso-8859-1?Q?oxwr16C0TncUh/mu6asXKrdYu/cqY8c+SZWpXlML8YFB5JSI8YJTSoezfY?=
 =?iso-8859-1?Q?uz7Yg2knAio853+DizlPRm4921H45ehYCit2uMG+rMGwS8Lhl3lM291II/?=
 =?iso-8859-1?Q?nKVF63mYyqMf1cjVxwoUHdLttMXVGumE+Hd0QkecIChI9OCiVKhC4GJT6l?=
 =?iso-8859-1?Q?cbEj5d7Jrr1b1zTtCoVrx3g3Umuh3GRk98h5c1McupeeTxsu1nk9yqnnXn?=
 =?iso-8859-1?Q?3GnXEdiFeXKWZiFxZY9muTkxs2uHGXWLq1sn49g2/gwgTHeBCjqZoC9r9B?=
 =?iso-8859-1?Q?JN8qPkpaOZeN1M1MQqnotSQsIfol5s7NxpNLL3Z78GLHb02Rckns2s9WBf?=
 =?iso-8859-1?Q?3Toc+AXyY3oFjI9BD1AbY/OHdH7mF2o8OuX0r0exkpmmsaJXyKCOBz2toB?=
 =?iso-8859-1?Q?ca4vBwVFzTYRBcUiLM1GlH5dbhrp/f15ZKdhWtzcjnB21ETKZd0JYXeU7b?=
 =?iso-8859-1?Q?SvKpbx3e5uepv4P1c9MiRusDvp6WrkQ6B+8PihjZsHRF3K1Ka7ccwYjVZu?=
 =?iso-8859-1?Q?qtHL0T6MAkuDagF5u+kbJ8gJXJSjKSW4ptVw7WtnDeyVTyteCMrYXLIsFQ?=
 =?iso-8859-1?Q?oGQywsD0MJ3VbTVnsJBQHVVmMclwZyL6WQknWnLo+4dgLdve+b34xzbPCC?=
 =?iso-8859-1?Q?uDg9QUPtZ7LZxNSGljIyJnYypgCnv9g4ql5+3BST5Yhf868oYpcYKLHKha?=
 =?iso-8859-1?Q?RiJOF7SA+H/YMdRaK9R2W5G6cl7wNxCYL1uhYmwYKKG+gPVfW9Wf4a8th7?=
 =?iso-8859-1?Q?czNQ/5LRcX50CGkiw+75MbAbkmFAq7g4QFrIL83Hsmr8GN5g4JLL61tj8/?=
 =?iso-8859-1?Q?ApaCxT9/q5/C0TNZHr7x9FzZUIg9b1qsrYcGEioATrqMBf2KHJXbmOasYX?=
 =?iso-8859-1?Q?DnaVnubTgaAqlpgm3lQbEoHj0XHQhbvAgq30i9pZ+ZVJpzzKKSHoZrsUtU?=
 =?iso-8859-1?Q?+tSbLU8JTu9eIkVNCvzWItDrTBYGwZNpHiNoSedl2Qzgf9VIxPdHdHyZRL?=
 =?iso-8859-1?Q?YglqvY5WEpueVecLJOa7fR/PvFXvOFZHbBk22RK4xmGTsoNnR5HalzoWaK?=
 =?iso-8859-1?Q?NO8ajWCM1E+RqqPZ45AiDIgNABwTi3M6V2mXRSGS5iA0uIOWFYuP7sSQ5D?=
 =?iso-8859-1?Q?2VC3H4HkrkGDx+27mjrtmgXgbILQDiwrDE2ogcWQM0T2JLHtBFhXbG8aE1?=
 =?iso-8859-1?Q?RF69h5VZSIypnBcIwU35+NjTMZ5X+w2XwLRX/Vv4z9RaAB8jfyorpdxNK5?=
 =?iso-8859-1?Q?nB9m8HkolBlVomFNTuNTdcpver1x38FgDn9I1CdeA+eqNxGrJsTQax4m6y?=
 =?iso-8859-1?Q?jz8iEbZdRdrZT5HZZ3I/kbVST5iTnB415vIfzIQyWDqM/W85F7itjLsQjb?=
 =?iso-8859-1?Q?isiMkedH8lMlpGpUwZwGbza5fLMt2owv6ipC6Kn9Pz8ND1pSG222h4RQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IWdckG042ODBuXStKGA43YxjgJ7l6onpqXuJPK+yeCCvRbL56k8iroR7qU9UclesnzLX1URE89jz35BI76uzHlGWR+YLWFhJ7oE1UfxCq5hwaAFORsUvXHyVJNZxNNbfCS8Kb5tTkkFFFyV9JNjCFYmz8P+mrAnST+a+xgh0AyJRCbJR+m6HywuL5+NLiWccIBWvuiDJWc5ytdHhJF0RksOqjG95/jaiPollG3GtzOZR52GKQfX62bHHJnn2VRsP3GQoazbGJGruHqV1AjGdJX9wBkMe88EjUI2mdOF+qNuBh1+hPrNF87nBX9d829Aw8fsMVYerkZqOLxSFLYrC2tYSiWi+vBuz/8NvmQnyitUZm7Y1OVbqwk38Lc0VfDKK3ueo0SY/vwIaxJn34X2C3y7e3J5B/Mo+6X1wrCq7qkjprErHK84prLV9XjG42bbJLy12nMK+iQo5p79Ac+kAPIPLFABFeAGqQOhvOK6FG1Hy+BDtRiInjRKWLntnl8EuximAdOx5P02tP0gvzHinog7yycYzZI0bSKgXqHmK1NpEIrty8acMrvx+E5erYtL2k9N57QkrI3IsXhTUPOvryueI0aYG0VwXW4apLJzeKDU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6957e532-d3ac-40ff-a250-08ddbd9036ee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 19:55:25.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqVXcgeRaBd8eCbNh/HUj/3HhzVuaDMbUyQpSADj4JFqXr/yt+2yxkHIgwtDkQ5x96r1/KEyVwUxd/KnPo8Bml3sYyPXhxa3gFjcFWt6aLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8157
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507070134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDEzMyBTYWx0ZWRfX/U91bkRjFw8H mUQv85SRgkP8LM77nfyDUZZzPEk6/NSs/g0k2L8Ff0byTmWofCny7a+4WnWr5GnBHqd7vv3Vqwx Mfj5gJV5uivCz9Szt1L7Duzm92Kc9M+WeFdtwfVX4GmrZf/1lEvY6OtIeKC6cbITo+Wb8rORJbE
 YDVuI9hNw/RaICPMKKhIovxP2svBeakkzzHhQ/cakNAiBQKXSaQfRqoC+IChHxmnvLR/AgxHFEO ACE2lekRIrKx+OCsKRHW5lruiaP2wln5XqHTWfz0nTto9NwaDk2MZhD42RqJ1UuaVH53ucCyaRk Bx/UOgPPpnVkJvEGCXvMcESyS45TZbHKWyVjwS7/RVDqFuJXhdM8/5wd11iuy9ll5C/8zXRmBKB
 q7fpq8odLisT8uYIkw1yc9nhS0iSZFwWbHPX9ocQdOFQk6M0ykHA66YiG6WEvow5i4KLYmG8
X-Proofpoint-GUID: kHHXCyXz6oq8fOKWh3rQ8SqqUgtgIbD0
X-Authority-Analysis: v=2.4 cv=LMdmQIW9 c=1 sm=1 tr=0 ts=686c2632 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=VY2G1WYkyN9oWE3iKDIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: kHHXCyXz6oq8fOKWh3rQ8SqqUgtgIbD0

On Mon, Jul 07, 2025 at 07:14:35PM +0100, Alan Maguire wrote:
> On 07/07/2025 17:53, Kris Van Hees wrote:
> > On Mon, Jul 07, 2025 at 05:32:19PM +0100, Alan Maguire wrote:
> >> On 03/07/2025 23:36, Kris Van Hees wrote:
> >>> On Thu, Jul 03, 2025 at 04:59:44PM -0400, Kris Van Hees wrote:
> >>>> On Thu, Jul 03, 2025 at 09:23:46PM +0100, Alan Maguire wrote:
> >>>>> On 03/07/2025 20:03, Kris Van Hees wrote:
> >>>>>> On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
> >>>>>>> On 03/07/2025 19:26, Kris Van Hees wrote:
> >>>>>>>> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
> >>>>>>>>> On 03/07/2025 18:06, Eugene Loh wrote:
> >>>>>>>>>> On 7/3/25 12:59, Alan Maguire wrote:
> >>>>>>>>>>
> >>>>>>>>>>> On 03/07/2025 17:43, Eugene Loh wrote:
> >>>>>>>>>>>
> >>>>>>>>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
> >>>>>>>>>>>> patch 3/4 feedback).
> >>>>>>>>>>>>
> >>>>>>>>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
> >>>>>>>>>>> send probes?
> >>>>>>>>>>
> >>>>>>>>>>     dtrace: failed to compile script /dev/stdin:
> >>>>>>>>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
> >>>>>>>>>> inet_ntoa arg#1 (ipaddr_t *):
> >>>>>>>>>>     Unknown type name
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Ah, sorry yep I have a fix for that one in the next round. Basically we
> >>>>>>>>> need to add it to the core set of typedefs and add a type for a pointer
> >>>>>>>>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
> >>>>>>>>
> >>>>>>>> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
> >>>>>>>> this I believe?
> >>>>>>>>
> >>>>>>>
> >>>>>>> Unfortunately the #pragma include doesn't do enough; it just defines a
> >>>>>>> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
> >>>>>>> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
> >>>>>>> typedef to net.d and doing the pointer lookup/addition but that doesn't
> >>>>>>> work either. Seems we need the core typedef + pointer addition or we hit
> >>>>>>> this failure.
> >>>>>>
> >>>>>> Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
> >>>>>> you should be set.  That is what I did in my priliminary tcp provider impl.
> >>>>>> I do believe that works.  Either way, we use inet_ntoa() in the ip.d
> >>>>>> translators and that works with that typedef in the file, so this really ought
> >>>>>> to work.
> >>>>
> >>>>> Yep, I tried that in the v2 patch series; Eugene hit the undefined error
> >>>>> in one test and I now hit it consistently for all tcp/ip tests
> >>>>> unfortunately with "typedef __be32 ipaddr_t;" in net.d.
> >>>>>
> >>>>> My assumption (probably wrong) is that the include of the library does
> >>>>> happen but nothing triggers the pointer type generation for "ipaddr *"
> >>>>> in the CTF dict. If there was a way to force that type generation at the
> >>>>> .d file level that would be great, not sure I see a way currently tho.
> >>>>
> >>>> Well, like I said, it does work for ip.d so I don't see why this would be
> >>>> any different.  I'll have a look and see if I can figure something out.
> >>>
> >>> Looking into this more, I think the problem is simply that you did not sync
> >>> all the dlibs for the various kernel versions with the updated ip.d, net.d, and
> >>> tcp.d files.  So, if the kernel on the OL8 instance you test on does not have
> >>> your change, it will fail.
> >>>
> >>
> >> No, don't think that's it; the .d files that matched the kernel I tested
> >> on (6.10) were synced; the use of the 6.10 .d files was visible in the
> >> error message. The problem appears to be around the fact that tcp.d uses
> >> the ipaddr_t * in inet_ntoa(), but unlike ip.d (which uses ipaddr_t in
> >> translated types) it does not have any other mention of ipaddr_t.
> >> Adding an explicit cast in tcp.d to the argument to inet_ntoa() to
> >> ipaddr_t * resolves the issue without having to add ipaddr_t to the core
> >> type list.
> > 
> > Can you reproduce this at will?  Can you give me specifics on OL version,
> > kernel version, etc?  I'd like to be able to reproduce what you see, because
> > so far, all I tried actually works once the ipaddr_t typedef is in net.d.
> >
> 
> Yep, it's 100% reproducible for me on an upstream (bpf-next 6.15) kernel
> + OL9. Moving ipaddr_t to net.d works for ip.d but not tcp.d in that
> environment. The extra casts for the inet_ntoa() parameters that I
> mention above are needed in tcp.d to get things to work properly for me.
> 
> I pushed a branch to
> 
> https://github.com/alan-maguire/dtrace-utils/tree/remote-tcp-v3-wip-broken
> 
> that illustrates the failure.
> 
> Relative to devel, it consists of 6 commits
> 
> 1: the v2 of the remote IP address change (ensuring the remote address
> tests won't fail);
> 2-4: a few prep patches for the tcp provider; and
> 5: the tcp provider patch (in a v3 work-in-progress form); and finally
> 6: the top-level commit then removes the casts I added to tcp.d in the
> previous "tcp: new provider" commit. With that change in place on my
> system, the previously-passing IP tests start failing.
> 
> If I "git reset --hard HEAD~1" on that branch (reestablishing those
> ipaddr_t * casts) and rebuild, the failures go away for me.

I tested your tree on Debian with the 6.15 kernel, and this is the result:

$ uname -a
Linux kvh-deb-bpf3 6.15.0 #1 SMP PREEMPT_DYNAMIC Mon Jul  7 15:19:59 EDT 2025 x86_64 GNU/Linux
$ cat test/log/current/runtest.sum 
dtrace: Oracle D 2.0
This is DTrace 2.0.1
dtrace(1) version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
libdtrace version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
Linux kvh-deb-bpf3 6.15.0 #1 SMP PREEMPT_DYNAMIC Mon Jul  7 15:19:59 EDT 2025 x86_64 GNU/Linux
testsuite version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc

test/unittest/tcp/tst.ipv4localtcp.sh: PASS.
test/unittest/tcp/tst.ipv4localtcpstate.sh: PASS.
test/unittest/tcp/tst.ipv4remotetcp.sh: PASS.
test/unittest/tcp/tst.ipv4remotetcpstate.sh: PASS.
test/unittest/tcp/tst.ipv6localtcp.sh: PASS.
test/unittest/tcp/tst.ipv6localtcpstate.sh: PASS.
6 cases (6 PASS, 0 FAIL, 0 XPASS, 0 XFAIL, 0 SKIP)

I will try to get 6.15 on an OL9 instance and try there, but either way, I
have a feeling there is a binutils (libctf) discrepancy somewhere?  What
version of binutils is installed on your system (nm -V)?
