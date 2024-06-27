Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACAC1A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466527; cv=fail; b=uYukRHQf+RmJa/D5ytTSylSBC/pxOH2ROVCj9Uue7uLGvmI9C0Ya0WbZtdCZvYMjgVnfHyN7/W1wmoFB8nJozeZBqXJj3aAySSrT4zZIWFiin5VkeVwAj3y7rKQW9TGdpGofHa7aa1mZkCclXUln5aosC9vcoTO1SEhOYhpAFkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466527; c=relaxed/simple;
	bh=3DuVcFNRnMAywgglpZJZ9kTzscpEv7//GxaA9qtoLiw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uPDvAifup9K17NA9id+YG1bUvmk2BLguRo0jBpZYZh00JSExi/lo8mz02q4NRhxbQ5hbDOVRCwi1WVkLmAqHXyh83mhClm3vj26u2MYHk5H6IHL8rf/fNHAjx1WHmSekSq3BkciP4ALBSE6SAzUWELSui9y1BWujEqzgTcJYlIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eFhMdOBM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zZK+0oQx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eFhMdOBM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zZK+0oQx"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMVvN010582
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=yyhUdj97hJVOed
	o1Ql/wQbC0da1jQgOWTe0udlWpgfk=; b=eFhMdOBM5WzY9+FXkoskDBBdrj+8il
	ygG9FtPKtyvln/gF7peQ7kQrbGqmnTiEQDQ1bxr9orHLFU2hqYyW8yVFAu0HOO4f
	KYrcFfwk4tqHEiyTxHh56HtMSBdvjuVebVYANrpoT5Z1G1+Lk36jYIcepGjRhHgk
	Jmba51GBvGfJAjMVScNQzwlqweqClWW2CCpdYCuf7+WZAxSalIUm7sBOJPoaV11s
	eiymQEeW/WTAZZq451Mi/qTm+62x5qw8WO17HpoY6zeqXAQSkA9koRHR3t3MVOcY
	EqHt2ZlnhuyfBPbbdJFppQeWxlXWP85ptUmX9v41ZR1cPr5m1GdFtxIA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywn1d4r4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R45qrc001390
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2amx1g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMEohX5/AhoCxfpVrWlHxjFLft/O/isNfgZLUk3NVDcxaUb6IbZA2pMoItItmzgYbK1AREL5ruyUrYvV2P+lgc6mHHUIvfiY5S9ELCNPkxKkb8Q74WH80DlLk/VxZsC2s3WiMUXDoHxjPme2qyCQ2CSDvQ3Zjc9BekmId7HXNp6RzT2n+4rOiPNm6jD5vku26uo1qNcewZS+qz1+7G5P0j5MVDQry1y1cUQu4QCvwoEDUZMVm/pZyFEHgcffzH/004tlL5mgvazb+0IU92gQQSpaKAdQp33l2ap2D9NKvc/QKJbDhWqwmL+X46yNKGBB4LVV8BkNAXsyCqtDpnX6FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyhUdj97hJVOedo1Ql/wQbC0da1jQgOWTe0udlWpgfk=;
 b=eArVkHHyqeXIADDsxMF+BQkipbDgqNXlNiL2L0cYa3itGM7ToA3a0YoWHvK224XR219+4e53YnkKbHKcelgrxhiAS/YCqfY1KZCnxAHlElajuq3z4V4f2J3lx6FLKixHlcc34htLBwN0z9LhLU0DkhQbI1aTLXAFIYjmQ3M9S83EUDmvLYFFukCuERrVsDiX52LXwARk6eLmPUagmHChq5ZSu662t8lsn6jQKsF8bV5paFYzW6PF38aN5Jku4cfYTJbG78fOg7/Yy6T7PgrUqoHArpnDep7RZB67U163gTOlsCYGJoqiPbR6GgNI6+9R6Tfov+LRmdxpWIC8y2JgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyhUdj97hJVOedo1Ql/wQbC0da1jQgOWTe0udlWpgfk=;
 b=zZK+0oQxnShuj4VVYZyLy+uHo7VBYC/shJ8zwGLqWhsuuLHdSuoC8In0el8HM8ddghK/SXoXJO7uDXlF+tH1pIVfMPZ2w3FGivj0q3gBaLe3LLx08vZuCerOkYAMnVpPLreyULuVL01PsElp4PcPm6llpl/K68eMF5jhSUw67ig=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6041.namprd10.prod.outlook.com (2603:10b6:208:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Thu, 27 Jun
 2024 05:35:20 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:20 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 07/38] Clean up prp/pprp/uprp variable names
Date: Thu, 27 Jun 2024 01:34:24 -0400
Message-Id: <20240627053455.21567-8-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fabc18a-b021-4381-24e3-08dc966aef0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9Ag1U3ImZStkCfga+Ei1eoEnJgz5Wv1CcDcHNK3+FaGDhl6F2sYPUo4hhfmA?=
 =?us-ascii?Q?bv2PkqS2FqGVs9hDn16niYCsfYlI1YlUIsBVBmunF96k4I2TcGHAgDSHRFng?=
 =?us-ascii?Q?idB55pYDJF1WWV9/XCP+PMcuxZSFnCUJhQf3mPK5taYk1TL+Sd1EyAC+56n8?=
 =?us-ascii?Q?c6dod+BW7uxusjO7ZuFaO56ej6DgHbbgJ7usfFvJMuL9rLtJVA0Bu7Tj4uHz?=
 =?us-ascii?Q?yUZC4u+zb9SNI8hA0uQKMdHVX2SbvDh7z0JKGMY63YCJn/SHp0hB1rACnRDQ?=
 =?us-ascii?Q?5hGS6ShqmyfedWw5i9AJ/qGrrxGxT/HHIWrmCJ0UTVQrFtvKhQZ8YhbQFSpk?=
 =?us-ascii?Q?HAqpdT+KNFkGpMkzxCgxXcKNQeVWSsImQ4b0+ZT4nbpLj19FLk/8URbJcP36?=
 =?us-ascii?Q?5owhRKL0e0vxuVim+IfUxpnI6v++rbTFfEdoEpOBJ9yuETr26zrgSmXPj13B?=
 =?us-ascii?Q?ssl9rT+U0QToQDAMT9R0F+ustwJ213uyZkQ0Q7HkAyPHhn4h73iBBFEJ7aOZ?=
 =?us-ascii?Q?8Z0/rMjrHJ4WvzekJWpR9jxXJBLpAhfYTWKBLvl7w1ExtlbBaBKUmpsw5uXN?=
 =?us-ascii?Q?1sd7kvHXZ8K7wcaOkwsIlIpdZkVhrcab5f3lazAYi2Lh2rpfYE/lmAiGQX9R?=
 =?us-ascii?Q?+r6h7hvR8BDoFS6aiXAGmJk/fCxLr0r8wyBfASV3bzwpIGS+5Ku7GdBK7J2l?=
 =?us-ascii?Q?GDC4sYnK2Dp3B9nyI2dfiumqGzQt/GpixaAIjDbK9orKeMQ3Z0KKZRguWSDh?=
 =?us-ascii?Q?Yele7Y28vu3m9qLoZkFaWN6IKfsOPx0uArYx1WQQ1KzuMw7GdGfbpMdnLaZP?=
 =?us-ascii?Q?fux3tM3zHOsIchGdCpLyGbCuuK1jIdyDIAeklwJFNHdIa2l+dxeAYaUjByKQ?=
 =?us-ascii?Q?axZHYDFwydwQvKXKX7ChCse18YWbYgTZTrkVZqSiLTS4IDUrHAAxpAi795V8?=
 =?us-ascii?Q?+kpYCRkGzC0QAvqQVaiamQKZ05KgoVMIOQ6kyBEGQAWysdgENpaekz9cUA2w?=
 =?us-ascii?Q?h5iIcM3xJR2T4Mh6M4HSA9Ib0vJ8YFt8aDGsYF3ygOKcQoLY4UQ/4xTguL08?=
 =?us-ascii?Q?8rrxCOg9ZUH1O4MACWSUZD8o3fmZPyk+4qNPXKl6S2tqoD7Bm4ddS/RT2TZI?=
 =?us-ascii?Q?pXS/4YGZ90DnUXEZIodnrZu3cpjiZpWOErZjS9VgL9bvoS2wnmy7TEQBdVOj?=
 =?us-ascii?Q?HQSxA7STnXWYrYzxKbzqFpzy9rQS4dVxC7t08RavvM+EfWK9xy/ehcYGl7hH?=
 =?us-ascii?Q?QFiXl2aIRjuOAz6S+ivOKMcG5QB+O+KvvQGd5+eIc98p0fLh0Ql633geuEyh?=
 =?us-ascii?Q?7POzQ2QLk7+c8Ci/1msiRQhY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Drt5H1dCoshP7sy+P81xwOjKA0KUV8LpmC/o9URFHXLWNuh4QIzVs7EYIoYp?=
 =?us-ascii?Q?UJy1tmC2sHnY5aktK30uv7/lIusPeGuNOkSOaRhz7DUeRljTHvOVWPOnw9Ze?=
 =?us-ascii?Q?MPPxD2vQvUUR265tusdc43m/flTuHQDciiykVpD8iQVIn0kUqAiu1cuw63Ug?=
 =?us-ascii?Q?cCypOpMCZpiL3xieth6AVso+7spJpeCbYXUTHrJyIhwLG3mo+Bm3bk4j3n5j?=
 =?us-ascii?Q?IidXMNOyb82lQKjzovy/df2Gtul5F8ps8RQxwdkJoDLm1T8CDIaCO7OiqfGQ?=
 =?us-ascii?Q?tzeLYbKdCO3xDuh9NAJH+LRZT+jBKT5PKHGsqEu2h3zzVg9+MahW1nllH7rK?=
 =?us-ascii?Q?cwQPeaAgOvkvx0FJ2RRKx0t5wEfFNmyY0PXX7PK8xTEFrlHD+g82KkZ5gZMz?=
 =?us-ascii?Q?AgJ5K0Qb9myboFN90f9SUKU4X8ohHfyau1XRgvJ8Aqi6nDx6JtpoXOpZQffk?=
 =?us-ascii?Q?yU/lA/PF/IhcH8jafaJHXKWSZUMNX0CXX8IJHBOtNp+ONuiuiiq715LTAdNM?=
 =?us-ascii?Q?hP81ieECueVpmS4HHRA0u1GiGI6ENq2oRQqmyhBz1zSZZcdczz7IwccNDY96?=
 =?us-ascii?Q?rGjUrrv4kjV1K8hL24a905BFpeQ3vbeD5cFmyaomqHcRRqXNSSpkMryLiLaE?=
 =?us-ascii?Q?TyO+AsDoTrbHvdTQecD8dfso/l6lArqm9Z/i5eJge7zuK/iu2IhT/71BktO8?=
 =?us-ascii?Q?lpa5rxAcRbDcYsPbCkkBSIEMla+bPiI3mqMOw21wu/lvbep62BGxOvhMrkw2?=
 =?us-ascii?Q?+uYLccs2IHkogV0myIxzLxJRaKKW+klTvmbFSjGVNI+fraYAsslW8XLnB1hE?=
 =?us-ascii?Q?l/hiJGE/5fME0P4z5AlPDlOxn2X8oYhwBr7rjbgmqdJsSRR6j8+pbkC6uHxf?=
 =?us-ascii?Q?yEUeQYGTk9sInjHJuhoP+Jin7vSQapqRlckjiPc2sZkh52Z2sHRqUKVOdaAn?=
 =?us-ascii?Q?pYrE8YCrlAnnDx4x1VoQx9yiIMXHDyh35dKp6/8WKSOdGZOoGpme6cRCHQBQ?=
 =?us-ascii?Q?OTuAHqT5cIG/zZbgYAzjeUzGqHuGxjW8m+nvMPcm5jjZWoFsifIMu/eznEBe?=
 =?us-ascii?Q?/AkCyg2hArWgoWRKYJ6ksId1RVJE6E8yIwtOGlNJLBdoMBw4XCnH5ewg8c/m?=
 =?us-ascii?Q?adwrgQop5m9htGvvrbfzZHgoHYpQU+Tc7JRTMrkw7+1xLcanZdQ3wIcDT54E?=
 =?us-ascii?Q?WqWua1oi1pvK7PPxPw8k9NjKUNpzN/s8TjPEf4m7Hvv1xzUB9Y2l0MBV21Vz?=
 =?us-ascii?Q?20KOWVulGxZq/3F23XWBgyyjf7qfNF4D1Qw8RvM8Mo7+ONZ0k784CpygQbKd?=
 =?us-ascii?Q?it5gMBHLUIbfqD872RJfla3OKF7Cp+hyZxphgfFwvEv7UegdZ7RXeROhctmD?=
 =?us-ascii?Q?1ZZrjZ7HK4mUzyv1h+YTu7ZfQ8JnACFviA819EFZ5t6Qi2BrzkFideV9AHuL?=
 =?us-ascii?Q?gB6QZsFObHjGedX/FMywSBrTovbd/4rgY/jFDSmom7iG3BnwCgRci7lK+AfF?=
 =?us-ascii?Q?H4TOsTW8/WezgJYjyIxQXYzwOfaff1Nkn4Aca2DfuT+iI14z704qcopudqd1?=
 =?us-ascii?Q?xLeS81nRA1FUMOtizWO3x+SgChWk2OLBWCA4TYA/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7diI6ylAEUuDlOmArwKDNHr/nzMCj16UWckYYaa3nCSAmJOvS+rWHravHdM0tpJMyLURPfXGkH4/H0jL62l0SFwOhUA0iNDJjeaHyVv7lyKL49BhgVp3p7YPwfltzb2/RYiLbCkwK3ShrNPEtisB8RKS7Rb272+ceQJAieMQplTvZqbR4kPW/bXfWUUiIxdqpVX2HLTK80yEvj5cnbZyQ/qxLADHJ/8F6xP/N19ua7PjyLASgYGS1aNtT6CBVzP3xgvc0DUj79muxEYzbzPcefWtTh30Gyuxx9Jz5GmvLDuzrRhEHV/paswx9EsOnZMOE9Zft8yLwYGROz+4bXpPQKrG7rt8aNj+pIcqTFPSpC6fbj5dEnGtyHtlYjqYlXRG/vWU/Wuta8rAUPCRGH2dLPbkPaSMslJDnzL6jAb2LiiwSwBYYkybUCUOsh97CdeH+0I8H0fEG6lfEkDoRUeCowM/cuy7V3DtBAI93ZwymuMHKX8wwb8X8zE/cpbNuPAbDwgoXEuBJsz17Jsj2Td/I1NRGqYAdrpOcE5Sio4fhsVBQNKq7vu3i0urJFFTZplU1is32rj1SRQSGsebX2qm84/EhI403htoykgRDeK4jo0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fabc18a-b021-4381-24e3-08dc966aef0c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:20.2203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5z/SKE49fXpARgx9mBOp/84v3h2aNSfSM1QHZbn0f1Kx6JViusP4qy6CFwZVVBEPoF1RbTgmoFAw/jQdlG4bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270040
X-Proofpoint-GUID: FZ2OGHOz5YPqWbbZBwVir9JhVhP_eR78
X-Proofpoint-ORIG-GUID: FZ2OGHOz5YPqWbbZBwVir9JhVhP_eR78

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 83 +++++++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 28 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index afc1f628..c77063a8 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -6,6 +6,31 @@
  *
  * The uprobe-based provider for DTrace (implementing pid and USDT providers).
  */
+/*
+ * This file uses both overlying probes (specified by the user) as well as
+ * underlying probes (the uprobes recognized by the kernel).  To minimize
+ * confusion, this file should use consistent variable names:
+ *
+ *     dt_probe_t	*prp;   //  overlying probe
+ *     dt_probe_t	*uprp;  // underlying probe
+ *
+ *             Either one might be returned by dt_probe_lookup() or
+ *             dt_probe_insert() or added to dt_enablings[] or dt_probes[].
+ *             Further, uprp might be returned by create_underlying().
+ *
+ *     dt_uprobe_t	*upp;   // uprobe associated with an underlying probe
+ *
+ *     list_probe_t	*pop;   //  overlying probe list
+ *     list_probe_t	*pup;   // underlying probe list
+ *
+ * The provider-specific prv_data has these meanings:
+ *
+ *     prp->prv_data            // dt_list_t of associated underlying probes
+ *
+ *     uprp->prv_data           // upp (the associated uprobe)
+ *
+ * Finally, note that upp->probes is a dt_list_t of overlying probes.
+ */
 #include <sys/types.h>
 #include <assert.h>
 #include <errno.h>
@@ -118,7 +143,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	char			mod[DTRACE_MODNAMELEN];
 	char			prb[DTRACE_NAMELEN];
 	dtrace_probedesc_t	pd;
-	dt_probe_t		*prp;
+	dt_probe_t		*uprp;
 	dt_uprobe_t		*upp;
 	int			is_enabled = 0;
 
@@ -160,8 +185,8 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	pd.fun = psp->pps_fun;
 	pd.prb = prb;
 
-	prp = dt_probe_lookup(dtp, &pd);
-	if (prp == NULL) {
+	uprp = dt_probe_lookup(dtp, &pd);
+	if (uprp == NULL) {
 		dt_provider_t	*pvp;
 
 		/* Get the provider for underlying probes. */
@@ -182,12 +207,12 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		if (upp->tp == NULL)
 			goto fail;
 
-		prp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
+		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
 				      upp);
-		if (prp == NULL)
+		if (uprp == NULL)
 			goto fail;
 	} else
-		upp = prp->prv_data;
+		upp = uprp->prv_data;
 
 	switch (psp->pps_type) {
 	case DTPPT_RETURN:
@@ -202,7 +227,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	     */
 	}
 
-	return prp;
+	return uprp;
 
 fail:
 	probe_destroy(dtp, upp);
@@ -259,7 +284,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	}
 
 	/*
-	 * Underlying and overlying probe list entries.
+	 * Overlying and underlying probe list entries.
 	 */
 	pop = dt_zalloc(dtp, sizeof(list_probe_t));
 	if (pop == NULL)
@@ -271,7 +296,10 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 		return -1;
 	}
 
-	/* Add the pid probe, if we need to. */
+	/*
+	 * Add the underlying probe to the list of probes for the overlying probe,
+	 * adding the overlying probe if we need to.
+	 */
 
 	pup->probe = uprp;
 	if (prp == NULL)
@@ -286,11 +314,10 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 		return -1;
 	}
 
-	pop->probe = prp;
-
 	/*
-	 * Add the pid probe to the list of probes for the underlying probe.
+	 * Add the overlying probe to the list of probes for the underlying probe.
 	 */
+	pop->probe = prp;
 	dt_list_append(&upp->probes, pop);
 
 	return 0;
@@ -394,8 +421,8 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
-	const dt_probe_t	*prp = pcb->pcb_probe;
-	const dt_uprobe_t	*upp = prp->prv_data;
+	const dt_probe_t	*uprp = pcb->pcb_probe;
+	const dt_uprobe_t	*upp = uprp->prv_data;
 	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
 
@@ -441,15 +468,15 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 */
 	for (pop = dt_list_next(&upp->probes); pop != NULL;
 	     pop = dt_list_next(pop)) {
-		const dt_probe_t	*pprp = pop->probe;
+		const dt_probe_t	*prp = pop->probe;
 		uint_t			lbl_next = dt_irlist_label(dlp);
 		pid_t			pid;
 		dt_ident_t		*idp;
 
-		pid = dt_pid_get_pid(pprp->desc, pcb->pcb_hdl, pcb, NULL);
+		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
 		assert(pid != -1);
 
-		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, pprp);
+		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
 		assert(idp != NULL);
 
 		/*
@@ -457,8 +484,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 * process, and emit a sequence of clauses for it when it does.
 		 */
 		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, pid, lbl_next));
-		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, pprp->desc->id), idp);
-		dt_cg_tramp_call_clauses(pcb, pprp, DT_ACTIVITY_ACTIVE);
+		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
+		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
 		emit(dlp,  BPF_JUMP(lbl_exit));
 		emitl(dlp, lbl_next,
 			   BPF_NOP());
@@ -508,8 +535,8 @@ copyout_val(dt_pcb_t *pcb, uint_t lbl, uint32_t val, int arg)
 static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
-	const dt_probe_t	*prp = pcb->pcb_probe;
-	const dt_uprobe_t	*upp = prp->prv_data;
+	const dt_probe_t	*uprp = pcb->pcb_probe;
+	const dt_uprobe_t	*upp = uprp->prv_data;
 	const list_probe_t	*pop;
 	uint_t			lbl_assign = dt_irlist_label(dlp);
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
@@ -561,14 +588,14 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	 */
 	for (pop = dt_list_next(&upp->probes); pop != NULL;
 	     pop = dt_list_next(pop)) {
-		const dt_probe_t	*pprp = pop->probe;
+		const dt_probe_t	*prp = pop->probe;
 		pid_t			pid;
 		dt_ident_t		*idp;
 
-		pid = dt_pid_get_pid(pprp->desc, pcb->pcb_hdl, pcb, NULL);
+		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
 		assert(pid != -1);
 
-		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, pprp);
+		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
 		assert(idp != NULL);
 
 		/*
@@ -636,9 +663,9 @@ out:
 	return name;
 }
 
-static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
+static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 {
-	dt_uprobe_t	*upp = prp->prv_data;
+	dt_uprobe_t	*upp = uprp->prv_data;
 	tp_probe_t	*tpp = upp->tp;
 	FILE		*f;
 	char		*fn;
@@ -733,9 +760,9 @@ out:
  * probes that didn't get created.  If the removal fails for some reason we are
  * out of luck - fortunately it is not harmful to the system as a whole.
  */
-static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
+static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
 {
-	dt_uprobe_t	*upp = prp->prv_data;
+	dt_uprobe_t	*upp = uprp->prv_data;
 	tp_probe_t	*tpp = upp->tp;
 
 	if (!dt_tp_has_info(tpp))
-- 
2.18.4

