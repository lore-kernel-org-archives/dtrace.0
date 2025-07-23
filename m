Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB52E28B7EA
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 12:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275459; cv=fail; b=IYmwW5ilM9OEy3zQ+lO6i6M5K+y1CLoXPn5UJHsKJYC9FD+tA/C7W9J54yJxPJdkKWq5Jh4C+fW0h91McUMLgrxlX1suV//2PicWi/JcbE07+obJk0tqUmOHmFMkcnXWrrukaf9MgBwpHMCBfhVtfudH3csDqoWZxXI/YlOCZ+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275459; c=relaxed/simple;
	bh=H90dPVYjSUDKQcdJbDaJQXJj7c3h+s4pohBPUTvnivo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qZoSNOidjuzJcJkNgkPSSP7xkXknvDp53cJuo9+IHKBEhsvzrsxCDr4XrUVwYXOO4QqkZatL/h4ArMAnPdp+q4AmpvvvCRE2OtTlz/yhSKUg/xSFS1VvPQx1KbBwx1208dNe4UGuqItRk06wvJaFTFFEnYKC/jQXsOGR4ycH0eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PwAJNzb5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gwd+GTD+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PwAJNzb5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gwd+GTD+"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N8Mq7p021773
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 12:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=o3rqoKu1Uo+1E6etJY
	QyXiMwyUI1pOjytUKdddCHYL8=; b=PwAJNzb5dRZIVDZd92f+A1ncsy43nb5ZN5
	vQTGOMCB3igdnk1xe0S4pUfl1HmVwap+mEn5NTpDm/p2e1upwapXlFOk8QiyIdlH
	0dSOKBZj06oGquhKQ9fZh4mWa43S9uds0gV2Pg9LhkR1Fa2fOoRIBmPp79v1LIAL
	oHg85Zzydi+Hqp6ypfgasTPb7BceUJI6WbuLxJAMAoQWf6qOPQhedUKsucJ6wzNU
	NGXXLd3zJKsLJPpUcp9n6uxlR0oXHCKhnu7IFgnn3vjP9NUHAW4yyl61w2tKjW6G
	Ij1SYLcYag/zNorx6Ptf++ZZHwacg2QjDVfhUDyKeXethg+010uw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805hpfhf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 12:57:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56NBelmK014506
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 12:57:30 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tgvjs1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 12:57:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiM3G2hNnPW3XOYS9ci86FKoAYwDXacgG5H5fQWiB00Y3eKheHvgGaCYse9OQeiJBK5UvKLOJryTQOwViKo7OjvvB77pYJTyUj3UtWtomE1aJzw4yUXDKRhtJ4yaoOlbXvNqfZMtPHItEjqHa9OktfbNKY0of1Wf1Q/2DY5gb1Z3xAwuHqD0X1XE+LEpcAl5aFZzn01+bm2i7PbpsJ5iOsd1+Ljc5oDnyccbS9sovaLDj9s62HElaHggrdIs1O4EzW60rZXmG6BfUlDbgk2SOEv6HeNLsdTXGTpZ3oUExR05toa8gRH5/IBqd73HOhzpFo0pRugp3Wuvg4jvPmKnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3rqoKu1Uo+1E6etJYQyXiMwyUI1pOjytUKdddCHYL8=;
 b=Ge4c8ek0aw2xpYdXnsdv7xpqPz7WmFqxzUFk0l+mMuEOKDazi6FNjLjtwH2lWTdjYWvIu4RAk6WTIMu65KHeGg5o8e9D3Ms/lOQ7cSbxXk4gldqayU9bLf8jMtlJeCPJMKN+7VSLg7sPl6vmPKuYldWYCxgdh8MBxD5f6SmKuUbuRJWJkl3s01XIW+hu7sSHeF2cOoP6h9QRmLQCcPwcASEQK1Z3MIdWX9WTFCez3djCJBABwHBHislSjMxHr+8Q/ushsBZEuCRAE2288Ua18eH1VSOklHVHYB5l6X13lhUPm7u+b4HDTLWC6Vo3gfLM4hsUN6kRAcTTQYpoUoQ2vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3rqoKu1Uo+1E6etJYQyXiMwyUI1pOjytUKdddCHYL8=;
 b=gwd+GTD+DtDrZZ7g1HlXWfszPKrnslmVu/jZY3NSG7vs03ABRXH0UaKeFtH8HCXKRXKFHoTHTTT2VoPjcNmtrndXdBfK9RaejQvjB7y1QzcMSwUv2hMpbDiKTZVKP351gno3/1PkRxCwggd4JYDB1kSpkZUhAj3KUwFj3mHC1sA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8681.namprd10.prod.outlook.com (2603:10b6:208:577::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Wed, 23 Jul
 2025 12:57:27 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Wed, 23 Jul 2025
 12:57:27 +0000
Date: Wed, 23 Jul 2025 08:57:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] lexer: support // comments
Message-ID: <aIDcNMdLxkn1SUSR@oracle.com>
References: <SJ0PR10MB56723B89F0E03BCEB06A3FFEC25FA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <d9832c82-6037-4a96-9815-5f351eaff9ea@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9832c82-6037-4a96-9815-5f351eaff9ea@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8681:EE_
X-MS-Office365-Filtering-Correlation-Id: 6437ac6b-885a-4ee0-c412-08ddc9e879e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GkjZ+ERYlSA7TYqajVj2nx9DLj3Z3pTUcCR7IuceB6/yCwY1frAaW63ODIAD?=
 =?us-ascii?Q?bD0POZNrvl+9y87/LtM6sQhguCnk8X2gI9VjHBS7h9P+QtpMy5LZmSrpebu1?=
 =?us-ascii?Q?2HpV/nphxwNOeezcrMVUxQOPhJqwNRgTHz2v58yxIHuwXcJ614bUzKxG1X0X?=
 =?us-ascii?Q?eZr8xZoWxOFXyCmlSZA7K2yN7+3zDQ3ZIky6/i1HsPxwqxpfCRRJkRgOWkdu?=
 =?us-ascii?Q?uIkjaV2k1raJoip0p5O/HtcTVmdP5HULK/IEhBKN3jVUCmALuikTROUpEvEH?=
 =?us-ascii?Q?a/WmjSWRUNcy8bZ641aqphO1Cf8Vi3UEsuEynNgnevrKwmk3nGRs1UgNx0el?=
 =?us-ascii?Q?8B/m672tA5ziDL0xGYUkIBJvjiLwS6BrwA67OAjufDECNCALwnA1BLVf0f/7?=
 =?us-ascii?Q?M5y5LqwwbMYb2AfW3j2V0fwTCDmP0ov+llvRPlsNit48YRZJNBJMahCnWxLL?=
 =?us-ascii?Q?uy/H4mfTZ5acxQv8PYpCTZlrAQsUWjnUoSYwryGjCHCTnJAErWn2jz9JGEgQ?=
 =?us-ascii?Q?yJUN/DE2n+cFakJi7121f2Uh+kuABlDGVAsGypPjFUcW5SYNSR2ysBCYe4qD?=
 =?us-ascii?Q?u90E3cHMNBn1dSC11ksNXzei2MJjrppKEyu4JAs0NLw8sKo3/YbXanZRVgIn?=
 =?us-ascii?Q?OfDbMjL2gwAEfZuCFfngkx7hIJGCEM+HrlQAAKRfPzxeI74Fe7fYgICpn8C3?=
 =?us-ascii?Q?dtudvQvXzY/QLJ0GV8bXvfiJdB8WXx7/fHzi8KEums6ARbl4qyValc3yiQlt?=
 =?us-ascii?Q?7E4rDd9t1VX1hY9Vu3biP0JCemHs/6vJocPT2Yh1UjyTyi08TsmnU6VZI1Kr?=
 =?us-ascii?Q?n5GhfjTW7uJzfjBEchPPXZKHlM1FORKn83BJ/AmCJ5xFfpbkCQM4xd8AzjP9?=
 =?us-ascii?Q?CO/zpuuz3lk4TjnmVHOcjYsC9FcqgkbhiAEezSkHLPqeue65pvXTYx7tRie7?=
 =?us-ascii?Q?6E8YoAzfEBfDma89gVQCWoz0RlTslkmAvXKWqKZOaBLzGuK18OYO72GDiVZF?=
 =?us-ascii?Q?0+I3kU1ZDTrgDk4XdE5lf0QJg7sjxw6Wp7hIW+cmm1GAyTaz21d78UKl/SW2?=
 =?us-ascii?Q?LkhnHDCpGR3GoC1TId4a/95knpRHcf5ER8nnfs5/HBdxMEAxCPo6o5FUoxTO?=
 =?us-ascii?Q?yHOVz9LyBxC2ITBkGD/BOVw2njdRB9299lUypW1YjwPsVg4keR+h+PaS3YWq?=
 =?us-ascii?Q?3uXzhDqDoEPeFbTRJbL9W9mSGwrwPMa5pFGRmYn7MT+vd1grNL/KcdfFbqH9?=
 =?us-ascii?Q?gbumzTUiJ/dg9cUNIyvYqtde9ayGF/GAFyMQDc5lsVwMcLCULqB9FGe+eO6U?=
 =?us-ascii?Q?VcfR34RYERFYQdBn8q82ySryL9oZwAn/D/bQ5XAd6v8Qmq0KyO3ntyMta3M0?=
 =?us-ascii?Q?zo8MxpqICkJ5JeAPdVc9TTenVlk63PuWW8huWIFh19r1uC5A8qbA++50upOb?=
 =?us-ascii?Q?9K1z+pW5yAs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K4/5HDP5xkxFBC+jw2Nt4/GFgOHWlTONPvDQSnEiCFGgIKppRXA2crByuA/g?=
 =?us-ascii?Q?117hXqr2FJ4GLNb11vxuq8k3Q22C8Ny8ypNEDtENVFF4Ppf1DPFWVzFxVYog?=
 =?us-ascii?Q?zZcplswhG1cPqa5AWWn7ttiHzHWL4x+Ledy1AdLYipXQJ2p2z/knSLx5X7AJ?=
 =?us-ascii?Q?iE16LsSMg5kpUyozWpPTaTmm/ah5iy2KEWmp7LI+lZ+d3yQFldzhXzw1hoN7?=
 =?us-ascii?Q?gTnxA/7pRMLGrZAj5FSVLslHkvwB6294oMup4DUAxo+OrynqhBVYFiwKbJOJ?=
 =?us-ascii?Q?R3gONQ7mTyL+M1heB4jwIe/7yCtcmkaoOOcdaN/5htP+Ltu4yhlBDnU26y8W?=
 =?us-ascii?Q?jZz3G9GeabsHaH7dCvBvEyonfpf1FbvkXUy+l6JS7VSTXY9SCmmIiGrOt2u2?=
 =?us-ascii?Q?Mk0V57sjHvO/QsddsUft34GHDAXFuSkOMlvmIVrxRKSJ5k/6/X4Z91IBZfBZ?=
 =?us-ascii?Q?opAmMVDyuaJyfaA5CHEhz2XC31TlB4uUQx0qLdmR7mP82GFqKqxwgZVR7tj7?=
 =?us-ascii?Q?wrSIqnjHWPVVaBCGN0Hfjff91Lgs0RDU396EarnTkX6lKUbp95ARBvulcaaL?=
 =?us-ascii?Q?Lkb/8BIH/XcOVpS7gT+N2henM/64h3od9u1vASgcQMoV/oB2NXQ+Y+zLqThe?=
 =?us-ascii?Q?ID3xtnUVU8usBZK9s4nxDmfWqolI8x3RoBzAwrZMjewHle4j0okHDi+iEmCE?=
 =?us-ascii?Q?M2w0c8UmiMH9OP96m2wjpb2q1Pgf12P/Scs/M9wVhO6iZ0yTRLTdu0FYNmVG?=
 =?us-ascii?Q?i6GEghj8LzKbzof5Ya5XwK/HY9fvmgRFRjrRckuUF46BnXqnRa3HOZVnEGCK?=
 =?us-ascii?Q?WtemlfSCUVPYna12XjZ8lKJAfpvGoz6khTe9/lcj7PoFzIb2Otag7zx4bKln?=
 =?us-ascii?Q?PioSUZrzkfbPeKMFbAqYpKvS6ljfbn6zQmpiEAk0ewS2oWE2alorUFhxb0A2?=
 =?us-ascii?Q?pAt2L7g6BGaBGGmsNul1fhMGu+2AQxN8QNsu4l9qY6ii0cmbNaEgdV7NbHOt?=
 =?us-ascii?Q?1ui5MwkaA4GM1Cs63pLRBAGrLQSCfmTz1R8ZuRZ/7Q2F6l229K0Zvde+9r6m?=
 =?us-ascii?Q?EmLU5UKNFQi+Sa4T7rxMm47lxLWtDOK8ahhlnW+6cHZDcok8IHZmQjfY9s+v?=
 =?us-ascii?Q?6JY6lSA0S+Pqxy4uScyrXXauXHEcUm68vORG6NVdPLCACX5blA2MX2Yk5DiG?=
 =?us-ascii?Q?ub5ixr6kJ06vEjqcySb2QeZAqU0d0T9+OdrHe9El6G6bA8rbPIVaC0l7WI6N?=
 =?us-ascii?Q?SRL4rzTxCjuKK+lj/A/CU/+95Mhx7B5/Uk9U/RCui8b6xJAORdywWctDF/Eb?=
 =?us-ascii?Q?cFq557QaXQZkniOaMHL4thFlKKGqrCOXzxh+0LXReLLoo2SMRCgluEmwHn2h?=
 =?us-ascii?Q?r+8kKR8VkA/M6km4xtyjIRXxr4/8CjxDLOGC95jBcPzy6/+8sSsUPgPRvDPO?=
 =?us-ascii?Q?zGkxqiNVTiX8BZuu02HvvAe1e2oZ6xL9h6svmA3GB5cOdZG/2hVIrjmN+8to?=
 =?us-ascii?Q?Dx9wmn1+cu3FCRxO1BUqsCQJKo8fQu/pNXv06AdrjD88dAZs9C3n1spU+Jod?=
 =?us-ascii?Q?fqJKOarIsS/tlSICDCHh3O5diLP7ZQzjMMiAuZkqZpL69WKKSljZqSuC6jMX?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qe6QSkFLCDcGY/iOYE5vh9XgR9MrnYARHfpc34Bye5BqqZtWcn/d4jOT+CpusLuvxnJzYfVrID1SvPsZtNjNWrPQPagYGQs/Qe184Yd77Wt5s+jFl+AmlD7vg8yj+b4/og7cQYWFLmy7SZXFMI+dc7QeHuWLw3ur2xbqDjsOkfegJWBpiU1qruknEHLkXiXxVKBqxgUIP1TuJF1nF2B7G4yKaCiF4SfMS9iZAXthEpNyDClEdOERvXjVxwfrtyp9Apov04kbzhdmr+n7s+kmJ3z0dqSbY/799/7+9aLZb6hG0TCYwxgWZpw81vUFNmGB8TgMfMIoqrWtddRmmJzAmhlpP/zJKTTTEXus0NjzVzr4acGb5qmzea26oUN1krTcqwQmrETca0FgwMGJ1hmlxCH3eoeAg6V1uPs/rQEgl67ze0IkMkLEz68S1mHUX4akC6gAzaSrY23XozfQlm6JmrUNaHse8uTIAMoGNxZcMUv8ZlUDH8Uh1N/H+AWg9Qet2UjWagl5iPgWTC1Gxw3pqeXxPqJWbSzuJaE4wYX+WYsG8KaJ4MphkV/5cFq7BOVKpd6xbghTdnkPFaOo3yjhYJY5YhOHmDjWOrhX249+H9k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6437ac6b-885a-4ee0-c412-08ddc9e879e2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 12:57:27.3035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1SVcBTHhotEpWxyYfY1RAe695GNbrklQNfRftH9pS2A2D/a0uJyP5Ec2PishMzR7okd3Yq/pAfH0REGbiA+m5DHvU0BG6zRaLLbC8keSMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8681
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507230110
X-Proofpoint-ORIG-GUID: C3jRdDRM-idX98_QGn027SSmehdUb2t8
X-Authority-Analysis: v=2.4 cv=YY+95xRf c=1 sm=1 tr=0 ts=6880dc3b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=D6ZjvijiEK9tIz3CanQA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12061
X-Proofpoint-GUID: C3jRdDRM-idX98_QGn027SSmehdUb2t8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExMCBTYWx0ZWRfXw/TWeWJDecIw
 fM5TU//EvnXphtIeywCZlrW//FFPr0uHp2Izry8v+2d/RDqGENmm9chyk1w6L7105dDoYMKn8kE
 tdBp7YRGw0tEV8hRvuGLRx1CT8hn1VT1vjZ/BoIfX8P/qHQ3YINacrPL7R4bIVQn5UmYXS60dh/
 jMEWA29iUwFTWJMhudawC+fA69GfzGWD+dBI5zLL92qCWUSghRN3bLa4+nBGtpZ3F51baGMJAA2
 2Cz0wZkmSeI1Hut7Z+3awiM6Duhv5PnB/6hv49/lB7Ge4+TgPwWHHc4AzOncPtJ7PJ38iMSSa7p
 vh+UfKcWJCeP0OZ3DUijrsNDTdLZQoE7OFastjqk60uNyaDpRkqkO1c6Rv86MthdEMcwYxqYq84
 m4SBEvW43pP6wbtB8Bj2uPeAmWss+FS/2iuweVYIm2zEzcr0KMKNjKWGumyNk0yyhRdD7DPm

On Wed, Jul 23, 2025 at 10:45:54AM +0100, Alan Maguire wrote:
> On 23/07/2025 06:11, Kris Van Hees wrote:
> > Suggested-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> > Suggested-by: Alan Maguire <alan.maguire@oracle.com>
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> Tested-by: Alan Maguire <alan.maguire@oracle.com>
> 
> a few small things below regarding assertions as these are all positive
> tests now I think (allowing /* after // etc), so the assertions need
> updating, but aside from that looks great!

Oops, yes, was a bit hasty changing them.

(The purist in me still feels that the ODX people did the right thing in being
more pedantic on what is reported as an error in //-comments, but I can see
how that can be annoying to people - and we want to be be nice :))

> > ---
> >  libdtrace/dt_lex.l                            | 11 ++++++++++-
> >  test/unittest/lexer/tst.boc-in-line-comment.d | 16 ++++++++++++++++
> >  test/unittest/lexer/tst.boc-in-line-comment.r |  5 +++++
> >  test/unittest/lexer/tst.eoc-in-line-comment.d | 16 ++++++++++++++++
> >  test/unittest/lexer/tst.eoc-in-line-comment.r |  5 +++++
> >  test/unittest/lexer/tst.eof-in-line-comment.d | 16 ++++++++++++++++
> >  test/unittest/lexer/tst.eof-in-line-comment.r |  5 +++++
> >  test/unittest/lexer/tst.lc-in-line-comment.d  | 16 ++++++++++++++++
> >  test/unittest/lexer/tst.lc-in-line-comment.r  |  5 +++++
> >  test/unittest/lexer/tst.line-comment.d        | 16 ++++++++++++++++
> >  test/unittest/lexer/tst.line-comment.r        |  5 +++++
> >  11 files changed, 115 insertions(+), 1 deletion(-)
> >  create mode 100644 test/unittest/lexer/tst.boc-in-line-comment.d
> >  create mode 100644 test/unittest/lexer/tst.boc-in-line-comment.r
> >  create mode 100644 test/unittest/lexer/tst.eoc-in-line-comment.d
> >  create mode 100644 test/unittest/lexer/tst.eoc-in-line-comment.r
> >  create mode 100644 test/unittest/lexer/tst.eof-in-line-comment.d
> >  create mode 100644 test/unittest/lexer/tst.eof-in-line-comment.r
> >  create mode 100644 test/unittest/lexer/tst.lc-in-line-comment.d
> >  create mode 100644 test/unittest/lexer/tst.lc-in-line-comment.r
> >  create mode 100644 test/unittest/lexer/tst.line-comment.d
> >  create mode 100644 test/unittest/lexer/tst.line-comment.r
> > 
> > diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
> > index 9d502912..e8f3bc8c 100644
> > --- a/libdtrace/dt_lex.l
> > +++ b/libdtrace/dt_lex.l
> > @@ -35,6 +35,7 @@ int yydebug;
> >   * S2 - D program outer scope (probe specifiers and declarations)
> >   * S3 - D control line parsing (i.e. after ^# is seen but before \n)
> >   * S4 - D control line scan (locate control directives only and invoke S3)
> > + * S5 - D line comments (i.e. skip everything until end of line)
> >   * SIDENT - identifiers and comments only (after -> and .).  (We switch to
> >   *          SIDENT only from state S0: changing this would require new code
> >   *          to track the state to switch back to.)
> > @@ -46,7 +47,7 @@ int yydebug;
> >  %n 600		/* maximum states */
> >  %option yylineno
> >  
> > -%s S0 S1 S2 S3 S4 SIDENT
> > +%s S0 S1 S2 S3 S4 S5 SIDENT
> >  
> >  RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
> >  RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
> > @@ -408,6 +409,11 @@ if (yypcb->pcb_token != 0) {
> >  			BEGIN(S1);
> >  		}
> >  
> > +<S0,S2,SIDENT>"//"	{
> > +			yypcb->pcb_cstate = (YYSTATE);
> > +			BEGIN(S5);
> > +		}
> > +
> >  <S0>^{RGX_INTERP} |
> >  <S2>^{RGX_INTERP} ;	/* discard any #! lines */
> >  
> > @@ -548,6 +554,9 @@ if (yypcb->pcb_token != 0) {
> >  <S1>.|\n	; /* discard */
> >  <S1><<EOF>>	yyerror("end-of-file encountered before matching */\n");
> >  
> > +<S5>\n		BEGIN(yypcb->pcb_cstate);
> > +<S5>.		; /* discard */
> > +
> >  <S2>{RGX_PSPEC}	{
> >  			/*
> >  			 * S2 has an ambiguity because RGX_PSPEC includes '*'
> > diff --git a/test/unittest/lexer/tst.boc-in-line-comment.d b/test/unittest/lexer/tst.boc-in-line-comment.d
> > new file mode 100644
> > index 00000000..61f5961f
> > --- /dev/null
> > +++ b/test/unittest/lexer/tst.boc-in-line-comment.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: Line comments cannot contain begin-of-comment markers.
> > + */
> 
> this needs to be updated I think? i.e. Like C, line comments can contain
> begin-of-comment markers.
> 
> > +
> > +// Comment /*
> > +BEGIN
> > +{
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/lexer/tst.boc-in-line-comment.r b/test/unittest/lexer/tst.boc-in-line-comment.r
> > new file mode 100644
> > index 00000000..d57f017a
> > --- /dev/null
> > +++ b/test/unittest/lexer/tst.boc-in-line-comment.r
> > @@ -0,0 +1,5 @@
> > +                   FUNCTION:NAME
> > +                          :BEGIN 
> > +
> > +-- @@stderr --
> > +dtrace: script 'test/unittest/lexer/tst.boc-in-line-comment.d' matched 1 probe
> > diff --git a/test/unittest/lexer/tst.eoc-in-line-comment.d b/test/unittest/lexer/tst.eoc-in-line-comment.d
> > new file mode 100644
> > index 00000000..8fe2ff04
> > --- /dev/null
> > +++ b/test/unittest/lexer/tst.eoc-in-line-comment.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: Line comments cannot contain end-of-comment markers.
> 
> same here.
> 
> > + */
> > +
> > +// Comment */
> > +BEGIN
> > +{
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/lexer/tst.eoc-in-line-comment.r b/test/unittest/lexer/tst.eoc-in-line-comment.r
> > new file mode 100644
> > index 00000000..884cd554
> > --- /dev/null
> > +++ b/test/unittest/lexer/tst.eoc-in-line-comment.r
> > @@ -0,0 +1,5 @@
> > +                   FUNCTION:NAME
> > +                          :BEGIN 
> > +
> > +-- @@stderr --
> > +dtrace: script 'test/unittest/lexer/tst.eoc-in-line-comment.d' matched 1 probe
> > diff --git a/test/unittest/lexer/tst.eof-in-line-comment.d b/test/unittest/lexer/tst.eof-in-line-comment.d
> > new file mode 100644
> > index 00000000..a9207693
> > --- /dev/null
> > +++ b/test/unittest/lexer/tst.eof-in-line-comment.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: End-of-file in a line comment is an error.
> 
> again this doesn't seem like an error test?
> 
> > + */
> > +
> > +BEGIN
> > +{
> > +	exit(0);
> > +}
> > +// Comment
> > \ No newline at end of file
> > diff --git a/test/unittest/lexer/tst.eof-in-line-comment.r b/test/unittest/lexer/tst.eof-in-line-comment.r
> > new file mode 100644
> > index 00000000..fdf259e0
> > --- /dev/null
> > +++ b/test/unittest/lexer/tst.eof-in-line-comment.r
> > @@ -0,0 +1,5 @@
> > +                   FUNCTION:NAME
> > +                          :BEGIN 
> > +
> > +-- @@stderr --
> > +dtrace: script 'test/unittest/lexer/tst.eof-in-line-comment.d' matched 1 probe
> > diff --git a/test/unittest/lexer/tst.lc-in-line-comment.d b/test/unittest/lexer/tst.lc-in-line-comment.d
> > new file mode 100644
> > index 00000000..0332e1ae
> > --- /dev/null
> > +++ b/test/unittest/lexer/tst.lc-in-line-comment.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: Line comments cannot contain a line commens marker.
> 
> same here
> 
> > + */
> > +
> > +// Comment //
> > +BEGIN
> > +{
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/lexer/tst.lc-in-line-comment.r b/test/unittest/lexer/tst.lc-in-line-comment.r
> > new file mode 100644
> > index 00000000..3075b987
> > --- /dev/null
> > +++ b/test/unittest/lexer/tst.lc-in-line-comment.r
> > @@ -0,0 +1,5 @@
> > +                   FUNCTION:NAME
> > +                          :BEGIN 
> > +
> > +-- @@stderr --
> > +dtrace: script 'test/unittest/lexer/tst.lc-in-line-comment.d' matched 1 probe
> > diff --git a/test/unittest/lexer/tst.line-comment.d b/test/unittest/lexer/tst.line-comment.d
> > new file mode 100644
> > index 00000000..4deb66f4
> > --- /dev/null
> > +++ b/test/unittest/lexer/tst.line-comment.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: // comments are supported.
> > + */
> > +
> > +// exit(1);
> > +BEGIN // exit(1);
> > +{ // exit(1);
> > +	exit(0); // exit(1);
> > +} // exit(1);
> > diff --git a/test/unittest/lexer/tst.line-comment.r b/test/unittest/lexer/tst.line-comment.r
> > new file mode 100644
> > index 00000000..d4e4c325
> > --- /dev/null
> > +++ b/test/unittest/lexer/tst.line-comment.r
> > @@ -0,0 +1,5 @@
> > +                   FUNCTION:NAME
> > +                          :BEGIN 
> > +
> > +-- @@stderr --
> > +dtrace: script 'test/unittest/lexer/tst.line-comment.d' matched 1 probe
