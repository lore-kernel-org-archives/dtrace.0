Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B071B85DB
	for <dtrace@lists.linux.dev>; Fri,  6 Sep 2024 22:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725660089; cv=fail; b=D3yYa+zX9c6CgH/P2iZ7wWdgz8D3gzFMXATpnGiMm6iDwkOIRXMuPa7DtJvoIyC8PpQjPDMeWLPXoMTjF5wg2UK3Sn0aIT+TMrlxXuCu5PaJGqbDRk3kV/HhGZCh1iqzq2ZhHI+3/jSlA/6wQWlHg34/YNCBvu8umVTyjonJzB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725660089; c=relaxed/simple;
	bh=FTjxa9IEUAGjBadXOiPXjPBUddLEdfmMOKXizX5HXpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ixszxmeuoTXi1Lk5SjXXgjNK3OLebpiaoBMY6ameuN025G7ycKbUHy8dxELTEfMmE1HZWKxybQnvHikrQd8Ko2DaPNQqWuh4EfrEv0TZkLBg1u+sXhgljYAGD3LDsoeEXdSYEWu7DboorrOZDm3Y90H/bSnTw5U0Pnex7Xr5iho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ixzgor42; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A6/IBWab; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ixzgor42";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A6/IBWab"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486KXX4P010226
	for <dtrace@lists.linux.dev>; Fri, 6 Sep 2024 22:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=sB7m4gmSd5EMnx+
	QUY3bm/McPVQ6wf3P/iObqs5CJX8=; b=Ixzgor42J0gvy81SPkTvzkUCI+9jvkJ
	8ezrhaM8XH66k4E+lQ6XKNt6ca288Lc7ufCd6ZCa+cBp9rhaKOnm5crsGNah+Fp7
	BVy02VgCRaFY2AOwUIiB/W1ZFooo5djqc3vevJf/lz20vWubdlE8Kndw1hmA3l7E
	9MM8RoI86F3kXPGG1A7t7xNypjLTn4DpCeuI9Q8ehukl/0w8MDT/e6aVUthC4crw
	IpDU/+13lDNVnQQJitUDNxEXboAnUuP1fObne5kyjK6OfzNzmMbg1Whs9oNphjM8
	3UBNmWKNhw+QeS9X2t+QH8790MowUXVdgnAjIZIbfstIrSSvvZLK7rg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwjjpu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Sep 2024 22:01:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 486LIJWn003231
	for <dtrace@lists.linux.dev>; Fri, 6 Sep 2024 22:01:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41fhybtenf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Sep 2024 22:01:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDjnV4b+pKNQgs/fy73IoaWMMk1A2Ab4ju+SJ62By4M6DWE7Wvk2BMiRtYUHe+BNLSXFMJqc9V1B1mKKLcn99avw03LyBBxqX1kPW43KR98FFfMOQ64uwrdbO6x8Eyt0F82u8ZbqDA7ToL6YJWoUdVBWpnbQTFhNY/8UIpkXpMTA9XQgma3wwAstU0ZAMEf3YIzrsnL8vpzAgmf536L8M+kwrvEGqoj+Q5tlF8ppDzSFTMahZNkRQ61o1cR+ZYaHy3pTV9PINPZEkqa6lYcvfnSLr5haSyD3ob7aiHSOJbCQxEy04jGI5mSoSKHOFaL8Z+7W2tlG1Op/gQDFJdNJ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB7m4gmSd5EMnx+QUY3bm/McPVQ6wf3P/iObqs5CJX8=;
 b=Ok6yBbTueqACZzbl9H2dqqbAQxqmq77CAQDZRarE520VdLAQjN7rtyjjFC2C3Bj8g8irZO7+wG5hzM7u8HnQl3MR3+VxSzhTcDR6PITlOG5J3EetvYjOswLeeYXy2ExWXQcOSstA0dVqK+fJMdK3xOK2bkrpRbR9Xa/r7fW3isVkQjrbBIE7jRZsorjDi2d5t7XDV7067eKcMJ07SMiuDRfzyvbRBAJZwJafo1hBQhaNMRR6Oc3lBGoCQ4KCz3HBybAqXQNQFvXaCpJ4bBb1kIna+a75F+SCwDsB9336uxIqrymTvvzk2OalESZ55YIwH7Hg+DARqHbHooRVnG4Mkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB7m4gmSd5EMnx+QUY3bm/McPVQ6wf3P/iObqs5CJX8=;
 b=A6/IBWabLoQwXXXgyAW5Az8Ic1a8UiZUplhly9Xem5GB2WYDWrapUbHzzL7tdj1sOAv56QPIS/m1kQExM41DCLQ+G5xR83aU+4bNpvAFwEZpqvs9qupMxd1P5a16+WrDRNqaCChLilLig1CN1D6iHzwU5mrMJmcOys8y5bLc5oU=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA3PR10MB6949.namprd10.prod.outlook.com (2603:10b6:806:319::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Fri, 6 Sep
 2024 22:01:22 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Fri, 6 Sep 2024
 22:01:21 +0000
Date: Fri, 6 Sep 2024 18:01:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 04/22] Remove unused "next" arg from dt_flowindent()
Message-ID: <Ztt7rd7AuqZK7EZi@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-4-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P123CA0358.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::21) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA3PR10MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff4ed09-1785-4838-91f4-08dccebf7158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D/IR85D7tbc+MRyjcHbgEA8os1igNSlRNYPmXerwtMT++L5xJpsiAk+I2Kvu?=
 =?us-ascii?Q?Br6rupUGjAuUkngDZfUlp8VVIUtlHc19nQzChLjo0OuIlbhgDF2xtEP+ABJI?=
 =?us-ascii?Q?bq9Pbp2KzH9bxksIlkVbzutWMj/1tEiQ3G4sEKPULwikeHjx6v4g0CuUMGNm?=
 =?us-ascii?Q?227WzaOFgVmUuw/xoZRrvAsr9Pt2c+sZYEfgLw7w1Etv7hX1LSd/eEVvYY4u?=
 =?us-ascii?Q?2npvC766JJ3XQRzULnssyfkxF5rYPX9OZ+tIUCCSHvu0/DobrCITGjOtYL0m?=
 =?us-ascii?Q?24yO4JBK1LmyiJxu8CzRYekY/SRkyhoU3VFNFUnHPkfaXgQuVRlPucrD8Jbv?=
 =?us-ascii?Q?bWXM6M8vbKfHDSD0lQO2o9LrYUoCwbV3EutMAtied5W40YghnI7bWGP1Y9mJ?=
 =?us-ascii?Q?HkzOjlu02vyLI8One/6nswmDhzG9BlyTOmfX2h8gUfP6AVmirneS2axlyykZ?=
 =?us-ascii?Q?Ev1IEN22WSpcZ/RTdQBHpHdt4mSBFmVwTH1cCpz5vLFJQYolwSLguADZRuzh?=
 =?us-ascii?Q?/8xkmTFlSIBK1Bw/mnpzP8AyYpO6JUen7J0u8jVAEihIVKqTD6Dm4jX+B4/2?=
 =?us-ascii?Q?T7YWmqgbHtQfHymPWoSaM/EnKSCuJT5fs/b4dllAG3NXCB/2fM95F1ZznZnI?=
 =?us-ascii?Q?lh7ewiLNdWUu1UoJeWs7XfnDnWFOmKTpOfbXMZqahgFfxBXPBfzLYXw/6erJ?=
 =?us-ascii?Q?nRrpI3uAP7JQ23px7WamzVXMHA8R7oRQvGuwJo+jCAgHIddOB+3MTzV+29tP?=
 =?us-ascii?Q?3JZHx9OZ1dnDuXShchkFl5siwbUC2QSA3wMPxIE9WvwbZgsbb+VohE1SxA95?=
 =?us-ascii?Q?rOHarnKaaQX8k6sXpu26YbL2mnZM/T0S8HpW+HKfOrBEAqEw7ME+bekyRdae?=
 =?us-ascii?Q?WtJmJdEw6584T1MsiJrjcwkRVloJsUDk5gA2tr6bbEmPPqWUyPHBMYAMd+i9?=
 =?us-ascii?Q?Cvk74XO5aD7il3f0GC75HN+mXrhmF0gOI5LPK9I349hf4Y/KUvgUpzNFjIb8?=
 =?us-ascii?Q?6b9uTanQ6/VUN3fdfttncyAEiIBFS6UzJA5a/VG9zCL+j9GyTPt/kImoCRRD?=
 =?us-ascii?Q?WTePWGh8e94hMesx4pDLcIUIVEabdnu11VVbAGHb/V+kkIp27x1XUrdSMGx3?=
 =?us-ascii?Q?h7kPkIlxMVgrRZ/BwwHEkvzetKW1qboJ/g7A8aqiO9TixVkZck7k322+dMJA?=
 =?us-ascii?Q?D4Z7pXQxydcLmSH6cInEJa03IUik1IBFaZkXVbN0rDck6F2pfko/1l/FFsok?=
 =?us-ascii?Q?DixH3h3QhmmYgkFEz8H2VG/u/f268cnXQAO0WYC5npaxcsdopqHPVzo9HCzn?=
 =?us-ascii?Q?06faisNdd6mzxtOsMjaKKSHeFlLYiLVRpwl62uAXA3a2Lg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5S6CJGLRDIKvYAFQ8wd1GL/cUtoqimI9Yr3ML7JdUKfQoKHWpUd+cMLpqcll?=
 =?us-ascii?Q?jOg69lD3WSQCAGmJlfRhkYbLEJkf844GlVJDvZ4frHZwMkLx6jpUlzan2fPb?=
 =?us-ascii?Q?OqqlynkXjvRRr6inYWJLRu8opjd17/EP30EIiYl3gXmLaOXd/fQa9wJ5KoI9?=
 =?us-ascii?Q?3yZIvyeN8H7bklNhMMzvvIFFhkRb5KoZi3H+RPAzWH1p4JzI9PHnN8+nF4p9?=
 =?us-ascii?Q?g0emImO8SjRR6uPBPROFLK6YFdpw7q7O3nOGZ8GWBbOMQT162qu0WxC0hcRG?=
 =?us-ascii?Q?anmt8f93PWLqHgU4jXpBCy9k+cw/1Ef8VeVV0MZaXzBTQYf2lBKUzXJ5zkS3?=
 =?us-ascii?Q?FykbfrK1UArBEmxv4zicI82gxVzkwPehTT9zbB9NrnFPqAVYfjyUQ2JFSqye?=
 =?us-ascii?Q?ZhxQmpXA9eBD+Cx1nsK2iBDHd5OUQDEUtW1exBrAaeXxpsGCs1m2OqQHgFmw?=
 =?us-ascii?Q?u68z8HiUJFPjDtPfRPKUCXznTH8ESdw7+UcMd+4oWR+5B2uV53fl5tBDeOiG?=
 =?us-ascii?Q?/8lWqoR38E2zrZvJvva1BPsUmhO+szr81hKNcT0jhr5JQVUpkbjCRm6K7mjB?=
 =?us-ascii?Q?H/TJd38Vt194Lq4xRst3E2AgdXHToM5PmsawDh3i/R5R/8tIU0ZqKLcqQijj?=
 =?us-ascii?Q?Qy8r6+xenYK+BtAOW9Mcbt6ePxKrg6/NPts7BDbUNse77K94XV57AomSjZzo?=
 =?us-ascii?Q?mzIz7phq++7l1tfGdp/AVY01vFQD2jifHXvSqSLNK6nuveBwvL/tghvEJOj7?=
 =?us-ascii?Q?z1wXMITh7dou+VqMdPUkwNQQtjrh9Ej3tu8kYTAYalm15vOFYXfTujOwsRJq?=
 =?us-ascii?Q?X5iBdTRgdZJwQJPkoWpmLGzeJcUf4CtYhQNmQ6rlVgSfC8VNOWLxfNpgNE4b?=
 =?us-ascii?Q?UtKGERJSaWNKQaKbzz06+IXwKGOGd73NGdmI3skQ3sZzf0dF4xMb1V/8q/4/?=
 =?us-ascii?Q?eVQtMrIcano9vXUuA/WUJ2J6AiIoFyyuylvmUYSN4BHM7OgMjMtFHKCtSiFV?=
 =?us-ascii?Q?8nl9oym7jf4Tm1aQRZc5Tqr+0Bir049gjdtksZpHaKOgoK4rZt+fztmEgv67?=
 =?us-ascii?Q?jQKG6toWSxjPSVBjd5zV++bHqf2i19CQQRNF8bq2Ly705/MLy92Rr0cupIRu?=
 =?us-ascii?Q?4VqCtY0HoYv4wE56/G6b4VFZpAv5sllvieS3HauH31/x7jff/2n2ZMz43oo9?=
 =?us-ascii?Q?fSXAMwL0O4cGX864ZYqDzPNTSj36grIBt1y83ELVpWUL7GQobJXKFg4sDNac?=
 =?us-ascii?Q?BwFj2b6gErN+T7cw105WFO/+q7QG75XUgy4ile7tzDDmwZXRyDftK2ZQJXXk?=
 =?us-ascii?Q?lmIJENZyz9euI4wARDiaW1futQGzrfsBWUXcSm+krcFrXUeyiA6a67S1lRt4?=
 =?us-ascii?Q?/WyHr+PqLfgHHlvN8Yg1eSPdvAUsmUqks3VCHfTqKChv1w6dpWAwZm9H64rl?=
 =?us-ascii?Q?ZwigzCJirk9TXbD4tkSL8bo04v+CTzfC2dcJw0QNMLya/LB6Zu47pLNBC3MV?=
 =?us-ascii?Q?umd8wslqGoJx7qkkBTva4Q3HLOjgGZK8Slg+FB8etWOJ1JU9k1P6QaiIfeVq?=
 =?us-ascii?Q?mljLX58wsaE6/eS4LjPzAslhQBpdI/UWe/pEaL+fKpR2agsSVGxgei5jZc30?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RAISCAIFG8C1DHAnCDTjJee8R+EA6HXTFF4+9bOw4cYd/ioloyastm7wG4/4ZMMKqSPac9nc1uE/XCCB3ie+b8cdFTvD9gREZMVj9Ocv74jC2dQKgS0kHgh4EEgXn1E00w6IPhl8owRpP7iaFJceGvfPK26KZUQwkHHpnmUT/cdrYkscqiNv9a7H7vfauXNUALmTxQeDcCr2BACe8WkmKuEl35A+oRcxryzzTQNqvyVHlMMuAzQYMH+pmDxqZdngks27qnB93PKCnO35bbxwPPWtB3GPhql9YlWkceNopihwcF0sM7eKvf1j1+G38bK42yVwSeX8kHVMIKqqMDeTiX71jewfSO3tGjzj4GHv29gL9HxxT3gzVvWaQOpj4FWHZI1kE/QJVpVloXJsFKQ/hlCL7F5797ouWB8xgITbVT4uImrEcdPjEv7CpJSTnI2mbiQhpqMuXK+DxXr2b5jpPcciFb/rFioKnJnspVagEcZmgYB6nP7AGgtzoErBUOB0YhaE9K3C5q4spNO3EPHe8GzDiaW2uZCk9Cm1ds8gwMoFy55TkklHvLFuX36O3cY2y/BBnhsOW98wgwl25tU/4JT0/avba4kOJZ5XwLLIrP8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff4ed09-1785-4838-91f4-08dccebf7158
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 22:01:21.7402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUBWtubucSimW3bNMRJMgdSYutMDpMAyW61Bw21Fo1HvFMDrGV6VcmCd+PESdw16mTDMMMLWXiGWXMNizPpx3sP6OdcPYI05jGkiGjtBj0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6949
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_07,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409060164
X-Proofpoint-ORIG-GUID: lsDr5VmLlSeuOtfQR8zkul0g0YfsxpW3
X-Proofpoint-GUID: lsDr5VmLlSeuOtfQR8zkul0g0YfsxpW3

On Thu, Aug 29, 2024 at 01:22:01AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_consume.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
> 
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index f2d5cb74..6aa9812e 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -433,11 +433,9 @@ static dt_htab_ops_t dt_spec_buf_htab_ops = {
>  };
>  
>  static int
> -dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
> -	      dtrace_epid_t next)
> +dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
>  {
> -	dtrace_probedesc_t	*pd = data->dtpda_pdesc, *npd;
> -	dtrace_datadesc_t	*ndd;
> +	dtrace_probedesc_t	*pd = data->dtpda_pdesc;
>  	dtrace_flowkind_t	flow = DTRACEFLOW_NONE;
>  	const char		*p = pd->prv;
>  	const char		*n = pd->prb;
> @@ -448,7 +446,6 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
>  	static const char	*ent = "entry", *ret = "return";
>  	static int		entlen = 0, retlen = 0;
>  	dtrace_epid_t		id = data->dtpda_epid;
> -	int			rval;
>  
>  	if (entlen == 0) {
>  		assert(retlen == 0);
> @@ -486,21 +483,6 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
>  			flow = DTRACEFLOW_NONE;
>  	}
>  
> -	/*
> -	 * If we're going to unindent this, it's more difficult to see if
> -	 * we don't actually want to unindent it -- we need to look at the
> -	 * _next_ EPID.
> -	 */
> -	if (flow == DTRACEFLOW_RETURN && next != DTRACE_EPIDNONE &&
> -	    next != id) {
> -		rval = dt_epid_lookup(dtp, next, &ndd, &npd);
> -		if (rval != 0)
> -			return rval;
> -
> -		if (npd->id == pd->id)
> -			flow = DTRACEFLOW_NONE;
> -	}
> -
>  	if (flow == DTRACEFLOW_ENTRY || flow == DTRACEFLOW_RETURN)
>  		data->dtpda_prefix = str;
>  	else
> @@ -2327,7 +2309,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  
>  	if (data_recording) {
>  		if (flow)
> -			dt_flowindent(dtp, pdat, *last, DTRACE_EPIDNONE);
> +			dt_flowindent(dtp, pdat, *last);
>  
>  		rval = (*efunc)(pdat, arg);
>  
> -- 
> 2.43.5
> 
