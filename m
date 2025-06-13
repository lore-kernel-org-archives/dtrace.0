Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF9B433A5
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826143; cv=fail; b=Wg+wFGNBLY5RNbMMdZkFt7r0ROE6Pdbj6OgTZyCf98+2YM/Kxaoj4F81Usut0r4G9796ex2TSoa9bGwtd+jGLDJskTCRU2qGTR0i9HPeYZY+HeAiWXJDg3dP4qr9YbiV9oI71YiNG0rOQAoi9BZoU+BEaMgx6ROl3muBhXaNjTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826143; c=relaxed/simple;
	bh=P+Rn+zkYljfmvlQfEWqo0UdqwBEpzEgi8tY/bJxVSLo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=WkEg47eYTXWKqvRs14fx6MEOn88M0NM5kI9NtZoxApUuAa/nRNyZqE/WSQxPE3nQC377PmFzp9xDgpMNJDZtDPuLMxVh6duJBSl9R2DkO22SuAbdbJI/lr20Ja+aiWwGzzZrMXIdqUO29XZx5j4/OzauM4aVFcKsEKy2X7tkwX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JFTuRDgQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w2TEoBjg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JFTuRDgQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w2TEoBjg"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtcn8032669
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=rVgTL6aiTwq+e4EDHQ
	s5PB//8NxgG2xRzkUApuv+9dQ=; b=JFTuRDgQVZU3ql0GQ7EAbDLySfOKgDzdcS
	6XyBw3RRAa2gMKwy2QTBxsO2sAoPNTF+AOA0Ns1tuQC/y2z7A8dSx0LsQi/kwyhK
	CvqJU/cpBBHCb1tSpsOpdM1fmWmEHsME4KykbRjcFLgQZG7gaM7pVXFOsdfq6eUf
	GXQDs7Vlw7liDtb41h/Cch1KMR5sRNHdZ9hZ8RzcZmH3tcffLD/WF9i+j4EtBoje
	7efdVko9sn/pktfpk+g3O5+IjiaRt7FNHH/AN9UqNgedyk6gSQFz5asH/HVJnRjW
	XjYjBSKeh14Ds3r0X4DbpCsxLkghX8QcA0oe1QlvWfkE3Fo6Shdw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1vbrdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:48:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DEZ7U9037829
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:48:59 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvk7pfk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:48:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fg0yFtiDbp/5so+xeHW8NJmtR/yGcaC+L67PrG/MTkmty61uGFWsDkJ2L2SyNZx0UIBGTJWJQ51Eo47z1BJAMkBVbH8wDsrVDdZdUgADdaETuXg3c1yebr1cOlELnUb3oILSjRA30WupL5jpMpTFTwy/JWeB0qtme2CfCMbXQWIqiByBFqBgiOuUfqusdVG6bAFpoYVle0m9b7kc43UGqEaWqj291Nxe9upRYK6hNVhvm7qxpS9XexjtpXHQGBg/DhR2O7WODM+DKuarA0cqhMr8t4GkOtKO1DvnkY3n2uqT6392P70Goeu8sRJVYmyne8zNLZGhPnZyDrr3EgLlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVgTL6aiTwq+e4EDHQs5PB//8NxgG2xRzkUApuv+9dQ=;
 b=jVguWQYtAOUG5wHS/qTTAS2F8TmKYYDZogiMRMcmJImSc5Beflr6gUEgzV2nYu4PChzsAe2dUwbjk8MklHjRoYDbbtJujn4eTNf9lPWeRJJSlRhwMIsIi8lwliN3B41WirP51y1BpLVwvf/NBqbsIumyHmWUfNdLhGSCsMhhkG0a+Sz5WUq6IXmKEYfYAGJXX1RfFqgyoc+06bFJP2kBmEjy2U5vjibVVkT/5sPFDTcrrGclbGv9OoF7h5XAoK4ojn2+ZBl4p0TuL4AzonajUaukt9/a9B/DSndRjhFCe+qGKHfMHa9751qydlPnXby+lRyJlRJs8qgJb/YCK7UehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVgTL6aiTwq+e4EDHQs5PB//8NxgG2xRzkUApuv+9dQ=;
 b=w2TEoBjgwrE8FCmlMmqpDGir0/4nphWu39BHRgyX/4ukvQlbPZAm8bsmzPn2W+qc7mNY7voGPlQwXosqlkkhJ9HKf1MsEjQHrY4KlN5nLL5giyACEDU7NVQvVrouBIBvY1zOCSbuxFivmBOeBKMUyeRN3su8P/TrN3Z1FBBkcsc=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CY8PR10MB7267.namprd10.prod.outlook.com (2603:10b6:930:6c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 14:48:56 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:48:56 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 07/14] Test: caller and stackdepth tests
 for cpc provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-7-eugene.loh@oracle.com>
Emacs: the Swiss Army of Editors.
Date: Fri, 13 Jun 2025 15:48:54 +0100
In-Reply-To: <20250522180118.27343-7-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:11 -0400")
Message-ID: <87zfebbstl.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::22) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CY8PR10MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d5989e-e4c6-4edf-e8af-08ddaa896c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qEMoBN9t3vIDRwOw0eif1NhzfoQ3oJZCzb//WLsvqp5/CzAKL3CFzyNFL3bl?=
 =?us-ascii?Q?mOVEWoFvJ8PbPy5ZQXV899/eoGOjrqJnQxJXQMsjX6V7l0kSWF+67lTmMKqW?=
 =?us-ascii?Q?F3kFsR4+5myBLp4EH0ZsKmCWvz/5FaPmb8xf3WSZNtyG6/6Dg31tUru3yvxv?=
 =?us-ascii?Q?V768nCEPQTHNRHsITeTvyLx/3viZssivu93vyLPM4QmjsUHnH0AALtVMZGRG?=
 =?us-ascii?Q?w2RB2jzDSAYEWw8PkifpFRppWdhJZ+3Xg889w7ae3S4UNM3JR6w1LGtgEmfy?=
 =?us-ascii?Q?/4bDWGtCXb3yc0KJcfgt9aS6RbMeoT7uzS+gX5OjTleLxRj5W8dgzMibSWcw?=
 =?us-ascii?Q?PKe/BrrbkzrrlFOqajN5G+7Lu4K9dMZWPjhYhgXsioSe3xIuQOdYXZ2gUkC9?=
 =?us-ascii?Q?OmKwFfr7NIxgOAoYphQZwscUGCSAyk6hHtLGVVnroHKqh/esaLuIdLQMsDYc?=
 =?us-ascii?Q?yq95HMsPnBHJQ9KLTh68ktEoKfmGc7errq0cTa1bjgcupW8dY7Ibv3x3oth3?=
 =?us-ascii?Q?ldypsHVhfDt4Kh/tH1q3kqoYewpAwkvQTMrUZQ5w9ERdZpm3NkpFeBAyCr/q?=
 =?us-ascii?Q?JqxhcnsA6JnhqSZnVjKbKswGRZeFrNx7oy1rlvhBvSidcv1xdluZL/EQfC0Y?=
 =?us-ascii?Q?c9JdX/YaC76f9oXYgAX8MmSfXycqozScxizQwIYCj/aww7jCCQJmMCE+N/aN?=
 =?us-ascii?Q?4gobjAgKtfsMXbBJ8O+uWe26O6XIhuP2LYjyQ7eBjYoLqDcC0DjHQWYkPfnC?=
 =?us-ascii?Q?w5vu9cfBwpei3fF7y/kRanXSvRGKNrLyMCylRzPA7cL4ywCejmOJxaDNKADP?=
 =?us-ascii?Q?goZZEpl1tlvuiiS/KtLG54QsINFHfmTniX1einwhZZeucNrY+IlAz7C6CfVn?=
 =?us-ascii?Q?pZNkGm2jJi4xN5R9e+pE0xUqeYlXPD0Yy0Xjpgl7f+bHwl/QX95XUHjccLH5?=
 =?us-ascii?Q?GXuCWuZfKF8iUXA4KrgJ43K7IrJ9CYET39PFnjggDE7PzgzCOnBBd6QH5sF1?=
 =?us-ascii?Q?TaUhjqZhqhBv/robzUXT6FQabG0wNtzSM3wr+tghGV7/D37kJa571yWcmJ7J?=
 =?us-ascii?Q?gItVrn5LxdYYx7PYIZSjWd6ekF68BV9jcFL54g/ffv+sgpVvPOhItYzlddF/?=
 =?us-ascii?Q?DSlPTuliVk239pHQ71CgIaBA6gR9kuBPeKppH07EHU4BBtdNlWnxHjfoDmM4?=
 =?us-ascii?Q?1Uzq3OoSDLk2wohdQ5WGyO2edtv0TroAYeAkDrzR5lSZLlHo+sonXF60/g+0?=
 =?us-ascii?Q?NDRcjxYk29znB71TPJIJIgQHRoIhcLAmgY7Hu6i7DjLJJ18cQ/ZWhm7rgTSI?=
 =?us-ascii?Q?qy3a4p78EoZMbO08wHGafFgSAis2R8cb1Sifzd/jolSNzd/j6d92VTzfGEaC?=
 =?us-ascii?Q?3QZnxe0YjWglnXKYhbgQSN2hEwPaINSdAqXsFVxMDEF/+23wBhNqJ8j4rg39?=
 =?us-ascii?Q?MSn5/b7bG6Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rFxP6WHldfHNrb4mIc1M76bn3pIjCbtzucu7Ve0BuE7/FGIOtIhLAdLCXwA5?=
 =?us-ascii?Q?F9cN2oar922MXmBzujwzG5cknX+Ptt7WKwOnGoOb6KRhyoxcHIYLXGPRDm/q?=
 =?us-ascii?Q?aT50EkfPXuBSGR36pstlL3du8jRlkoP3HJKhRXa5kbtlJv2Kv8xkgFvOk8Z1?=
 =?us-ascii?Q?2h+TZGnEAmr4RsLy0yrvM0nfjirZVQOW8wDO577vYZ/rUiwEt3cDyArY0TxA?=
 =?us-ascii?Q?BAUl3e58HI1jkStL+jm/4jDrNdeHeImh/fhOg5KRuKDDt8AFd4I1ETCe8kph?=
 =?us-ascii?Q?Sfs1A3e2JUYGpnxAUKznYEU0fi2kWdepQYbDI25W/iZkPF44YORcXQme/LPQ?=
 =?us-ascii?Q?dV5jm7nZjqWbFaIwKLdxCaGzsWxq9DKwrwZ4aVGv89gnS+l01eOIizKX954z?=
 =?us-ascii?Q?cUTZh/69hhOGrN0cX9oddazQuXS0DWeNfZc188EHZ64nXMshG5jQ+mbrwTNm?=
 =?us-ascii?Q?dM/tv1chUZlAfWbHSNfgxyKVGZqD12v8j0La3uCygtw1igETU0g45WSDBWAC?=
 =?us-ascii?Q?hkhoOUlEXFJvjl6GGiqp5p/9+Q+FMhUxsURooLreXhbp63Enpg3MKI5PAzI9?=
 =?us-ascii?Q?fHI4pY11PipxPfwYEZxH81NIsvKOpYZY/Pe4lkk1Hbn+j5BXuk0IUgE16IjH?=
 =?us-ascii?Q?CLFwGuRsnXDASJOBOD+NJBPAc5R62NQLMGJq5aRVt1ixtsq24uIdD9lbol0v?=
 =?us-ascii?Q?PxFB5Gg/WeNDqvxaMJPybsoh9JhkrlrYpPWeRHrujA4aHktRqb9pwnP8aDIA?=
 =?us-ascii?Q?kZ7+CiVTLu6yyTRBBwXmi2H4fTCZpYhIVqESgDdZi2uTJADkGJxBEsSXcdN/?=
 =?us-ascii?Q?eplzuIaSP3e6Wab19YYULF+p0rLm9frDxjEbCY4akWwI33+2UAjYjc3rGqMF?=
 =?us-ascii?Q?oifrCJBY8pOzf+Mg2sVxoLIu6GQuW/Eo4qrBh8wtS3/Jyc2t1dF1Gk6/qdSe?=
 =?us-ascii?Q?wxKM3TVIvFLpKTQQb2m3oVf3LHuYHhc8pXLaPl72GJGRcEyRZUWI7+m4XZET?=
 =?us-ascii?Q?g6OzEpM5Iv4MxO0OPw4HY8p/p1Bvg8JxrxN45lZQCWhGtokHSprTVNxZCvAq?=
 =?us-ascii?Q?DwcQj6XvgeWzxbVfc9FR3qOzdOwjigSsb9kIAIKwiq46uxM1rbBqYBrP1bHr?=
 =?us-ascii?Q?7BZYirTumtvlUMQWWJLhYcc8aHHlNNJ5QpaFZTdfXaJRW/FP/jBhgQ3cyfHe?=
 =?us-ascii?Q?MK3a+1az02DlARvVS2IWa1nJnsrZESN6H//nH39NMovAZvpINGWgh4Lch+i5?=
 =?us-ascii?Q?n47L0e53TT4LRmbuBqRVxAKYRJ2PDJVNYpZezj2QvVcCn4ptmnaXaxVr940t?=
 =?us-ascii?Q?t4gufsX4P4xtckbNZh0DsA0zJoAHjNVE3with/aacr4JHlv2Jjbpoe6viO12?=
 =?us-ascii?Q?2csjnTOpfnWY0SGTdVEz+H5lNQApzfdyL70kRTGBGlAkBmjs5iTMm7JJRyzs?=
 =?us-ascii?Q?JO4m0d67qhoE9HVDjhMX9LAT5z3lNQ3TrOlWsiAee59AcKBfdlOjDtNlJWMV?=
 =?us-ascii?Q?i9qEX7DfrgpZ2kyU5vCnQqU5em5JJUrqBCi+k6fps/z/aYkGwoBbbRk7sFMp?=
 =?us-ascii?Q?cUqVh8aBah9RrQlpRKkNHTzkOpGwLKQLhGFpKcLj+xGaUnHdJCLLHtdwpXBn?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bL10QrOYC8wJtLv9+FnfeMeCbzdv71zV4JPObPpq0o8mAaEJyxdq72onHbG0xNJC7aiYqJ+MQYCdibBGCQCKCMOL35QBrwZOs2UDCPHFGZ+O4mpkgLlFFzewx1Zq6/lSL8/O5+iC/yNNa2DML95jFD8fHfl+M9kDPX847nsfAf4ndvzngoFhaIDbYVnj694YKt7KauER9G7+XTsBwm7KH9piQUckyCClO/4Wkf6T/i6RF4i3OVDZAPSZgCMoavU7PNMzPwG+cJXU7xQQ+iXEJ3crQ6YPW+Pxhr/QqUb6fUC6Ty3kGqhbbCcT9+9vxuew17dpsNprTw+wxRKXts3UaeahOVw18vQftofsTiXZKMYwMBILH9aGlcFdxEA04CCXoi4ej9DyXWtgjH0AH0x8nfUOFcWPP00KH0NDoCskDYF8vIFFNEo4LOl3mWDwMJ966dH3MVrHt9J8OhVQEuNHlDNTqBOufgegxXj2I23MKx7yjiRMfbSv2LH6Yn3l148yNPRluhfYPH2G0pM4X5HD6dLEaRrSln3zL/kqbIC78fBl/FsJK58K4kDW16DO6yoBycqcOcYSPMqScUNDpaU9Zs2jQWDge7VnvQaAj6vLLtg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d5989e-e4c6-4edf-e8af-08ddaa896c60
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:48:56.3860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNrA51wUSMOV5U8TA+KrfuRklKPVTWoO0w019wU/yRGUwI9J0cKH9/Z67RlLZjr39D7TYdiRCJ4kJ/h5MSis5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7267
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130107
X-Proofpoint-GUID: ysz8-XY75vMs2uvXIQGM9iqkQzKNweQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNyBTYWx0ZWRfXz70V7U9zDgsU 2IC9lTyM5lEgbafQTujHUqcFbOVBE95eKc+OaJfIFuqM6bg+6kYUftzhryApjav6jgCSRNYNqRp kcfYqlG4zJLV6oCXxqy7LRn6sooJKIquEeTi1SN6ms2NyknCV2ajaceJ5ulcDEEesSlKDhRZMu1
 +dXIWLawfkEa3s796325RtUWs8JvMK23BfJN6nepb6w6P/dxxxbCmImpV2OcDg+lWIujlOd0BQM c0UJ6TY0kdWpgZMp1f39ozMUgll1jphsiLCtzx/ZXx4yjU3CIVelS/EzbB8/oGgEbh2EgLd/IV6 OmuyOHcgzbijKh09Ri/wgEcVnxOdpFdiNdCw/nDft29ZS0WtLcQGyHgK2czsQPB5+0nGlfk5QeC
 E7KJdiHBVRUN8IoEMJovDP4/mJUTyP4PsEWCzHVN5iTmuOgv9FfYfEnBgN7QnI23qMD5dfER
X-Proofpoint-ORIG-GUID: ysz8-XY75vMs2uvXIQGM9iqkQzKNweQJ
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=684c3a5c b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=9IrpNJl8IjTFMo_ABhkA:9 cc=ntf awl=host:13207

On 22 May 2025, eugene loh outgrape:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

> +cpc:::cpu_clock-all-100000000

1/10th of a second: seems legit. (But having it use nanoseconds makes
probe names hard to read! Yes, I know we have no choice here.)

-- 
NULL && (void)
