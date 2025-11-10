Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C261314D12
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 19:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762803652; cv=fail; b=VAVHorA47bemMJde1T5v3wF+6Vrk5r8Vd3uFd4WBSjGYN2NRgxdcHXmgOFNuigvY5lffrRpHNYGobjHgFe15rpvX8+uEdACaABXRdJg9EJthm5ul2EcyAS0wiq21tjGZ8I4Ocp8NkWjpdzZgEI6VWI/VjnHWLUAoQ066XiBV8rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762803652; c=relaxed/simple;
	bh=fpjHHVH7jFFMPFeeO7ZgQSinNBfwOkzNUHoIAOwrpVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RwWn0jelWsh7bAAlNUhh1hlZB+NCRfowdd5nsZFT6/9wZhVxrZe1gFWQryxhQS46S6GhCc1RsbOX6hbTuZhk/haAezeCPfa0POfCK93HG7Ymf8k2OOEDlz5rpSBkOI2KlNRj7YwlgeoiH3Ne4IyGIwa3JZYJmxRLGm4L/iNubi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JD1dkhJ3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DowsNKRj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JD1dkhJ3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DowsNKRj"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAJ5idc022502
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 19:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=GW6MDmlFtMJYPJKx0z
	Lw7nMkdDQtmaFAJ6jtIEg4E7A=; b=JD1dkhJ3Bx/AzN4+7DdeSb4hxrmRpSLNhj
	vYlScyggMNh1wEPgnzMYsBXuwkwWoXyvnPOV8k4OgyIKRQW6E6l9VxpdYf93ekYc
	PZ102ANIrzRSMIhldhCSCGmzO5i0cVdB1hM07h3A8eAIW5u09X5+kRNyEEMP7tP/
	0HhpFsqPDTeseaHN0L3XRm4E7GHqsDoV0svNzHIzvWjegaUrl2YakiuiBHAP1+Ed
	Ljs4TTjDQcwLns0ftRy1eYWEzyOPshMd2hik7mdqlRr1LXEWRt50X1k5PJIGE4ky
	/ShsmacUZ2Z4QJUUvbFdG/BVVSUw38gJhu+NOl3oY7lIdfMzg62w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4abnw6r2kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 19:40:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAHxuge007564
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 19:40:47 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012026.outbound.protection.outlook.com [40.107.200.26])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9va93y83-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 19:40:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGQFHc9Nb6LkqSUH2chudlzBqrhik0uHixJ/RSA2Y0RAUriM4A1W/Gn0UaSnaSmSZCaKSkRaHPGtMBVphMR+N3o9uoEGmrgUzXekqnY4kXP18KBU4FP/Er3UOBMO5VIPPqE3wxu498altBaaQDcByZZQDwfdGNACRyz/uHHp9ewVsPZhM2SZgVrWPP6a8wtGE+spn8BPcog1/VSV1gC3OQYIw72Y3+XfrXxZcf+pjLzCyT9lVgz4xdrvH5vwrB6wFSpoZ7X1SeIO4jrS5rfuBl9ZMV/f2wEs98BHj5Gw/BBF+EFdQkl47ybHxXIu9tANLG9Rn5PYg06y9sGkTx6+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GW6MDmlFtMJYPJKx0zLw7nMkdDQtmaFAJ6jtIEg4E7A=;
 b=gsPATu/CBOpP8Nyf2L7hTdEZUPzW6EIH0N2KamnOCn0FZVlYN18Tda56FDh+dk4vRDWgDt0RvAAcWE9RzJM3Dvajx1qE93p3RhpJerNQtZegRrBubZ72bLVml2KWIzuMHUgCZ6DPoDdVA1RDky4AvhZomIh0eyoAALXia9o8c7XWaQb7vtT2SdTWOoFnmG9CSeKm5calj+biGvsraTZ9lCzYfpBujTRImQ9KvR8l6aiEjB5JaI8vHwSyoREKLM1by+M8d4ib8bY0387iujBE+KdRM6nkoPw2enWNaXXWx7T+HsvfJNv+6cPW7K6eIipQqjd3eRlB1ZVKVyDdCdPN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GW6MDmlFtMJYPJKx0zLw7nMkdDQtmaFAJ6jtIEg4E7A=;
 b=DowsNKRjPu9YIg7rFyi5MJ1aSaIAHyGQoveE0pKcgBulvWT5QcJm47ivgG7Rh41giRcCggTaDDlw2lpFF9Dadh8UKDcD36LoK72gLqWDoj/3Pvemb2ZnqtGN5ioFDr9gO/9+HZEcqr1NJWzEQwWSI7EGpBkx1lYjehSGL3fMf00=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by PH3PPF8223ED5C3.namprd10.prod.outlook.com (2603:10b6:518:1::7b2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Mon, 10 Nov
 2025 19:40:44 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 19:40:44 +0000
Date: Mon, 10 Nov 2025 14:40:40 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v3 2/2] Extend the USDT bit mask to
 multiple words
Message-ID: <aRI/uGVRThspw5v9@oracle.com>
References: <20250723005304.8407-1-eugene.loh@oracle.com>
 <aKTng7/MOecCH5u2@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKTng7/MOecCH5u2@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|PH3PPF8223ED5C3:EE_
X-MS-Office365-Filtering-Correlation-Id: 61afe2b2-207d-4f05-d606-08de209109ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wj73GZkl8a64NicRjXqBdMRpy0MJpkS3iovMPLYQZ756R1A4eeHiUp+641EI?=
 =?us-ascii?Q?rvl/CYUIFQCqBl1QNwjHAGT2JMIrwqKkrIXiiHaXq6yRGQ6HDG9NxpGw1NZ2?=
 =?us-ascii?Q?1OSAJo+rTNISP64X9pkLeautX3K/AhDQ1qQOop/p4wdp9gebS/x5Hefu97+5?=
 =?us-ascii?Q?uk5XcmCnQLLd60QHmEQGScye4kjFdNlI6O3ONwdRLeAZB2Lzr6qB/JU0CI8J?=
 =?us-ascii?Q?WmLUS2i9Ms0QD81SdpapH937XK04RpP0SII+Xa/N0zexu2XmFL3MqT9SpYX6?=
 =?us-ascii?Q?bOAvg0K4JUDLUlfA804vFqLRKsfIFyxmA5YzAxCvEqbR2YQwwS9GJUIjuG8F?=
 =?us-ascii?Q?P2Nj5mjGT+7pwho9CyWSSl2QR3mVV9OCQOweiCPN/pF9pezzqorkz+ZD5CtR?=
 =?us-ascii?Q?yEz6t716+usaoGa1PLcNxjXIURbvavMXxoPhxD2KMcOggWmJD5h6b2u1o1iq?=
 =?us-ascii?Q?444WZQtzY8tNiQAJY2FlVqm7R0y8PCj6uWAUaC62qtWMUwdj+xQAa1bY33Lx?=
 =?us-ascii?Q?KOSzhHFRgy+4JWrVfBHF65Pif+0RvqX0eG9/Xs+5uwS4LI94AYYRnpbwCDBW?=
 =?us-ascii?Q?hEmlhWCoZfXZyP4eAyXPwEfgVy7DKAdNlHQS9Gj+5/1ZKw8uuK3ZP3+pT9jq?=
 =?us-ascii?Q?Itkzek1WfeMBg5ZhYqApivE8lKtrKtPEUcaxhDfLvHVaLb2PNhmSJZ/vqsRC?=
 =?us-ascii?Q?mg1b3vSQ5LwLDyBdrDiyilvOGeGob0dUr5jzgsaYwx4lgwsrzaMTTc/GXvxH?=
 =?us-ascii?Q?V7x21TNYk+YYbSy7KWyB88HsRhf35GYHzIK40sLlRyxhrMsyIJjpzEHcozKH?=
 =?us-ascii?Q?erq+Bp9NkVZC70p+kOs25yGQ18y520MpHdWhX5C93wq1iY3J66UPh7tbHF8p?=
 =?us-ascii?Q?OHBMUAYxqDTMObwDVRq8ZGNHamg9h1dzT7z6XeCp1OcmsQmFZ3ZS5SKBehSM?=
 =?us-ascii?Q?eKklZJomOfyhEJR+3LqPV6WBDmG3cylAGNo4Gd8cBqCPdZLZ4Ia2SNX3ybTU?=
 =?us-ascii?Q?xkLnNklZYbtmQuJu1LIRvER808QgqwqvsLT7z1uMZJtr2X+V7gIhkNC8vq6X?=
 =?us-ascii?Q?OLptm4FeC1O19+ImOlZHXIARXjoEsDstaS0i6p6tcuIbJJa5REPRzWrVWuYq?=
 =?us-ascii?Q?yVcOV/OlYF+RkQ9yw+aetWA3Ibgx09+/iu4zDMgzLtYhmqrMf4rovwd0JcOF?=
 =?us-ascii?Q?WzDKVCt5bDsl4USl+bs/MvhHC3DshORwCWO8DQy5azpnP2CLp0uJMLRlxSYR?=
 =?us-ascii?Q?/P8Js/BXitok3bJlNMot1KGQESxqdJlubZ1MLOEnPCELXp3wttKTogJiF7KK?=
 =?us-ascii?Q?jsaveMPbU9UX1C+d+Y0OtyhNha+ba37OwqfK4cmFh4ozz2+806n6uI5eibFC?=
 =?us-ascii?Q?W0O5wEbapwn1A6Zz4CnskU3kb6RiZpwNW10zrIGJmOmBnewBLjKFVeUX01Xj?=
 =?us-ascii?Q?kvbeYzl5IHEPa390a7Iq91UdKLvbqq/IbZACHYXfQkw3urc/uT+DhA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NVJ/sNX92s20BRS8e4/AtNZEnDCW1vAQYbntFMgxB09AWeiCu5EtB/AgHW6y?=
 =?us-ascii?Q?fAZhMRUUs0wt4aqAJprWHGYr7NNhxb/5qYLgpnjLmWuQcG07cnCl4m1BbDQ+?=
 =?us-ascii?Q?ABKmtYghX3z2duMQ3tE7T37eI+mC88upoPZjFI68X4fL/9Aa8EEQlYlcg8vo?=
 =?us-ascii?Q?wo04yZBma60Pk5xw0G3AIJLiky5/Oida8+vvQ6XDYszNDkUJpK3AL6KSW0uQ?=
 =?us-ascii?Q?IHYdEeqe5BcWzBZdgRnxzQAAg3NRDCibzq/mNnXYGQvm93OE2KKcxDMvgY4N?=
 =?us-ascii?Q?kCJxjVVYtUKui26YDPGuIzv9+kYOQOzIDlW3eg2SgpeWwCP4fyttSbvM2Du7?=
 =?us-ascii?Q?AxpLuuf9JhObkg97glXuss13MKyDWUl6rVKhO/8osgcfplI+R+Sf8yC28GlY?=
 =?us-ascii?Q?fWeI99dgAmltj4g6f04j0vXBowNyLzftw23cvrDYzvh1CF8GhTf+1d/2h1RU?=
 =?us-ascii?Q?wIAtBBrXB5WAdKpi+4u4ioeeMuElPMOIUcXhQKH0Sd1jpPPowdK7sFJPoVZj?=
 =?us-ascii?Q?pfTu/9v09SlKy4fs8KFXUAT1e6GCZQIAMloxNJpduuI8Klz6UR58+40Uk0Qw?=
 =?us-ascii?Q?FlH95qNBWcQV7mKUdqt+kC/oh5wFbOsi8QQJs1IzvggEYs+1ogIBd+mJG0OZ?=
 =?us-ascii?Q?B/lMftPs8s3hrr8qrGAV+f4Cxl2ZT463EmzdnoWKtI0dpsDx/TGKCagS/nXU?=
 =?us-ascii?Q?4BQFQSDWOGV0dAcCFj7M9XoglX2Q1RrebbUGF4RvZSJUm1RHnGApO0/ogSZp?=
 =?us-ascii?Q?yeI57PGnim9DSIng/M9HWfkbWx38sFryntsfVwiTDUg/YdRaYN4vghMIxKip?=
 =?us-ascii?Q?pKgnlYYhBcxpYg5kT58lAGgjn05s0B2bZkWFKa9rbYNLBUgHSsuI2ZUsQLq3?=
 =?us-ascii?Q?H/8GlYtlZuWqf590jnNrOG4d8GlYwF8sMZeSduRFhcW8Vhrld/wi4+7ilGhy?=
 =?us-ascii?Q?YDVjWPdv61BdkVjm4A4/oGTyzzqSrPmSohNPNY1tsTgiiTPKDSCuZ4GbgRWQ?=
 =?us-ascii?Q?+TPe7Q5oKInbrcREXB60wSJOUYJBm3umPCeaZQSJ5rTq0tAviCcS1bc4R7TB?=
 =?us-ascii?Q?rEwH2ZhDcinUCJJlV+d/0I9sXR3vTpV9JFJvpf8S/D0vIyZ30ZEj+eMnNJnc?=
 =?us-ascii?Q?/tS04WMm7apV3CJn5pEQY8e4siIWMXYzS2SqqX4ZjOl7Tp4unwnmhfkOcMBi?=
 =?us-ascii?Q?/2KWX7TOakPTFdx9WxZR4YhQuT1kzwuJFTmQutfsZxt2M18rkN1lWy6XS/lD?=
 =?us-ascii?Q?9CIujpQRHTWkDVwWiX1RGlo01PkM+3K2Bm66Jj2cTYTk9mGKC0wFl5WiMl1s?=
 =?us-ascii?Q?fF9Fq7HRAHS3Hi5A2qvJgGMUxsShlUnIDTjRi0ou6f1WlUA1SPw+GSRG7Ul3?=
 =?us-ascii?Q?mkiyG4bX0GHatAs++uyKeHSGN8biaH9Z3IECzcaTpIlcH77RtgJzbhg2OxnD?=
 =?us-ascii?Q?Q895T+qOFs6jwCjTLGCld5I94hmvYsqy5UAztK58K2gAGcWJhB8YSC5BDv5b?=
 =?us-ascii?Q?XlL/Uv4r1604Hdn/BdijjjROuCRVrbFQwZRV8YYlSVNhRTsF+zcdqy9+2sa6?=
 =?us-ascii?Q?LZNNC0sa5MW97I3JWWbANNW6vn3bnga6wDk+MqLmrupz/RazfX+vXLVZGujk?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	25MRMvyikIhYEtvTuXQgcIYeuBrdhZisQ7yXJqeoKubGcSyuTVxB9ntLrgwThqwgtGeGoPAmNGTy4GXxUGIo3gomPi6dPOCCeWy1JmvhMy1WMv8waiXKBtUk3Kk1/prys+nrOCnQtAu/Q06pbfaviPBYyeuUQt2Q/OTxkMAMNy2sMeOvSJPx6azQl+JsinD+VLmCZz22jNvys9GMXpgHnxE94iiXhl0CHuh/Ex6peHy5Pdv1hLRhndGP3YemHO/UHPcPOA/hEvBdnV8o3Cig0p2Tt3tI8p115SV6F6EmkMg0Mp6NArpwp5yn81T+lfHn+fRwPB2G8D41yYlNOqUx4RZInf03oLCrUovOqd8BivQl1WIfnBGFi1VTSWWmLW3xWIFee7CX6e5Tj9rXmvkNESxIMeE29G6KcGzSTb1sbUPFwNZWix5Fkqkv9xeGJeOb3GDl9/nLIeyzUjKEu9PwDRon3chGtBhLCfSQ7f2w82qDWGpqeJ5DwKG2+c/X9+kWQ8b6Cz9Mq9k7y5H2k404kbSby789STZH2j7H98QeWqtkpOsARhI1/LLhIepc4IFFHz9dolC8VIXv0Q4PilAT+ZOkObEMsGH1WPF/owYT7yk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61afe2b2-207d-4f05-d606-08de209109ae
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 19:40:44.0246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sq4m27GuQfGsXqlHCQ+40kSzNsBIPnkazVqtSLrtYw3FFkGqT42YfomX/BbXaQSZ951fiU+aNf0so1LiupbOxn0o++UZTmNbKfvGFcjGL0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8223ED5C3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511100167
X-Authority-Analysis: v=2.4 cv=Rv7I7SmK c=1 sm=1 tr=0 ts=69123fc0 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=BmytvUDPrcukEh0PjKIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE2MiBTYWx0ZWRfX9xJGummfrelC
 R9hklGVDbJnfwFPhovXom+3EjEBzARiTMc88rUVO5NL99jtzRvh0V1LqlSsrA0d25awFbAwPBSb
 zl6ez8Bp6sZV0dw7fl0c4XojDnbhQbK7tSDCRNKyaOxTVjb4SWPyrusckXcRqC1P5gThN6dRnpc
 NQ0fO4i02g1M1DAxs70QLjs788aAf2SSn39QVnZcwhG7rToH1ezn3pU+rX6xyZ7qRTl8zmDtEDE
 KSe3N4xE89GB6DJ99ND0tNkf1NpTHGfCKD9/DC9ykXmY1A76+mVpfnNlD6Ss8vQFLAaxgfl0Djl
 uRqIL/kimJN5diYM1ciOMF2a+DKFt8bB1rDMtdSF0ni7DITY2bBAdWV0EXprUhrrZOsta/pTYnS
 Us9tjT8nw+aiS09ww4F6gPXbGWeQlg==
X-Proofpoint-ORIG-GUID: sGz3C5uhmq8LwP8DlV0NnsNEFDrGVA5m
X-Proofpoint-GUID: sGz3C5uhmq8LwP8DlV0NnsNEFDrGVA5m

The pid-specific uprobes support removes the code that this patch applies to,
so it is obsolete.

On Tue, Aug 19, 2025 at 05:07:15PM -0400, Kris Van Hees via DTrace-devel wrote:
> I would like to hold off on this patch a bit longer.  I don't think it is too
> likely people are running into toruble due to too many clauses, and it would
> be nice to avoid adding more provider-specific logic in the core of DTrace.
> 
> My suggestion is that we move the creation of the USDT-specific maps to the
> uprobe provider.  Since those maps are only ever used by the trampolines
> created by this provider, the fds and other data can be stored in the
> provider specific private data.  Upon first call to generate a trampoline we
> can check whether it has been initialized, and if not, create the maps and
> populate them.
> 
> This way all the USDT-specific handling remains within the uprobe provider,
> and we actually fix the earlier inclusion of creation of USDT maps by the
> generic code.
> 
> On Tue, Jul 22, 2025 at 08:53:04PM -0400, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > Currently, USDT is limited to 64 probe descriptions since the
> > underlying probe uses a 64-bit mask to decide which probes to execute.
> > 
> > Change to a multi-word bit mask that can be extended to however many
> > probe descriptions there are.
> > 
> > Also, change the mask words to be 32-bit rather than 64-bit.  The reason
> > is that, commonly, there will be fewer than 32 probe descriptions.  In
> > this case, we shorten the value of the "USDT prids" BPF map from 16 bytes
> >         uint32_t        prid;
> >         long long       mask[1];
> > down to 8 bytes
> >         uint32_t        prid;
> >         uint32_t        mask[1];
> > (The second member is smaller and no longer costs extra padding.)
> > 
> > We also add an
> >         int dt_usdt_mask_bytes;
> > to denote how many bytes will be needed for the mask.  This value is
> > computed by usdt_mask_bytes_init().  Currently, this function is
> > awkwardly called in gmap_create_usdt(), just before the value is needed.
> > Such a call to a provider-specific function is clumsy, but there are no
> > other calls to the provider between compilation (where the number of
> > statements is determined) and this map creation.
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >  libdtrace/dt_bpf.c                            |   6 +-
> >  libdtrace/dt_bpf_maps.h                       |   4 +-
> >  libdtrace/dt_impl.h                           |   1 +
> >  libdtrace/dt_prov_uprobe.c                    |  87 +++++++++---
> >  .../unittest/usdt/tst.manyprobedescriptions.r |   1 +
> >  .../usdt/tst.manyprobedescriptions.sh         |  64 +++++++++
> >  .../usdt/tst.manyprobedescriptions2.r         |   1 +
> >  .../usdt/tst.manyprobedescriptions2.sh        | 127 ++++++++++++++++++
> >  8 files changed, 267 insertions(+), 24 deletions(-)
> >  create mode 100644 test/unittest/usdt/tst.manyprobedescriptions.r
> >  create mode 100755 test/unittest/usdt/tst.manyprobedescriptions.sh
> >  create mode 100644 test/unittest/usdt/tst.manyprobedescriptions2.r
> >  create mode 100755 test/unittest/usdt/tst.manyprobedescriptions2.sh
> > 
> > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > index ddd849d0b..fcb53f044 100644
> > --- a/libdtrace/dt_bpf.c
> > +++ b/libdtrace/dt_bpf.c
> > @@ -967,6 +967,7 @@ gmap_create_probes(dtrace_hdl_t *dtp)
> >  	return 0;
> >  }
> >  
> > +void usdt_mask_bytes_init(dtrace_hdl_t *dtp);
> >  /*
> >   * Create the 'usdt_names' and 'usdt_prids' BPF maps.
> >   *
> > @@ -992,8 +993,11 @@ gmap_create_usdt(dtrace_hdl_t *dtp)
> >  	if (dtp->dt_usdt_namesmap_fd == -1)
> >  		return -1;
> >  
> > +	usdt_mask_bytes_init(dtp);
> > +
> >  	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
> > -	    sizeof(usdt_prids_map_key_t), sizeof(usdt_prids_map_val_t), nusdtprobes);
> > +	    sizeof(usdt_prids_map_key_t),
> > +	    sizeof(usdt_prids_map_val_t) + dtp->dt_usdt_mask_bytes, nusdtprobes);
> >  	if (dtp->dt_usdt_pridsmap_fd == -1)
> >  		return -1;
> >  
> > diff --git a/libdtrace/dt_bpf_maps.h b/libdtrace/dt_bpf_maps.h
> > index 884dc3983..ec5d4d7b1 100644
> > --- a/libdtrace/dt_bpf_maps.h
> > +++ b/libdtrace/dt_bpf_maps.h
> > @@ -1,6 +1,6 @@
> >  /*
> >   * Oracle Linux DTrace.
> > - * Copyright (c) 2019, 2024, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2019, 2025, Oracle and/or its affiliates. All rights reserved.
> >   * Licensed under the Universal Permissive License v 1.0 as shown at
> >   * http://oss.oracle.com/licenses/upl.
> >   */
> > @@ -48,7 +48,7 @@ typedef struct usdt_prids_map_key {
> >  } usdt_prids_map_key_t;
> >  typedef struct usdt_prids_map_val {
> >  	uint32_t	prid;		/* should be dtrace_id_t, sys/dtrace_types.h */
> > -	long long	mask;
> > +	uint32_t	mask[];
> >  } usdt_prids_map_val_t;
> >  
> >  #ifdef  __cplusplus
> > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > index 2adc1252b..8bbc4dc1f 100644
> > --- a/libdtrace/dt_impl.h
> > +++ b/libdtrace/dt_impl.h
> > @@ -397,6 +397,7 @@ struct dtrace_hdl {
> >  	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
> >  	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
> >  	int dt_usdt_namesmap_fd; /* file descriptor for the 'usdt_names' BPF map */
> > +	int dt_usdt_mask_bytes;	/* size of USDT mask in bytes */
> >  	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
> >  	void *dt_errarg;	/* error handler argument */
> >  	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
> > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > index e8f9f8c98..8b55fe319 100644
> > --- a/libdtrace/dt_prov_uprobe.c
> > +++ b/libdtrace/dt_prov_uprobe.c
> > @@ -403,7 +403,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
> >  	int			fdprids = dtp->dt_usdt_pridsmap_fd;
> >  	int			fdnames = dtp->dt_usdt_namesmap_fd;
> >  	usdt_prids_map_key_t	key, nxt;
> > -	usdt_prids_map_val_t	val;
> > +	usdt_prids_map_val_t	*val = alloca(sizeof(usdt_prids_map_val_t) + dtp->dt_usdt_mask_bytes);
> >  	list_key_t		keys_to_delete, *elem, *elem_next;
> >  	dt_probe_t		*prp, *prp_next;
> >  
> > @@ -418,7 +418,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
> >  	while (dt_bpf_map_next_key(fdprids, &key, &nxt) == 0) {
> >  		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
> >  
> > -		if (dt_bpf_map_lookup(fdprids, &key, &val) == -1)
> > +		if (dt_bpf_map_lookup(fdprids, &key, val) == -1)
> >  			return dt_set_errno(dtp, EDT_BPF);
> >  
> >  		/* Check if the process is still running. */
> > @@ -431,7 +431,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
> >  			 * we might delete the same usdt_names entry
> >  			 * multiple times.  That's okay.
> >  			 */
> > -			dt_bpf_map_delete(fdnames, &val.prid);
> > +			dt_bpf_map_delete(fdnames, &val->prid);
> >  
> >  			/*
> >  			 * Delete the usdt_prids entry.
> > @@ -452,7 +452,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
> >  		 * FIXME.  There might be another case, where the process
> >  		 * is still running, but some of its USDT probes are gone?
> >  		 * So maybe we have to check for the existence of one of
> > -		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
> > +		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val->prid]->desc;
> >  		 *     char *prv = ...pdp->prv minus the numerial part;
> >  		 *
> >  		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
> > @@ -590,6 +590,31 @@ static void usdt_error(dt_pcb_t *pcb, const char *fmt, ...)
> >  	longjmp(pcb->pcb_jmpbuf, EDT_COMPILER);
> >  }
> >  
> > +void usdt_mask_bytes_init(dtrace_hdl_t *dtp)
> > +{
> > +	int i, n = 0, w = sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
> > +
> > +	/* Count how many statements cannot be ignored, regardless of uprp. */
> > +	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
> > +		dtrace_stmtdesc_t *stp;
> > +
> > +		stp = dtp->dt_stmts[i];
> > +		if (stp == NULL || ignore_clause(dtp, i, NULL))
> > +			continue;
> > +
> > +		n++;
> > +	}
> > +
> > +	/* Determine how many bytes are needed for this many bits. */
> > +	n = (n + CHAR_BIT - 1) / CHAR_BIT;
> > +
> > +	/* Determine how many words are needed for this many bytes. */
> > +	n = (n + w - 1) / w;
> > +
> > +	/* Determine how many bytes are needed. */
> > +	dtp->dt_usdt_mask_bytes = (n ? n : 1) * w;
> > +}
> > +
> >  static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
> >  {
> >  	dtrace_difo_t   *dp;
> > @@ -651,6 +676,7 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
> >  	int				fd = dtp->dt_usdt_namesmap_fd;
> >  	pid_t				pid;
> >  	list_probe_t			*pup;
> > +	usdt_prids_map_val_t		*val;
> >  
> >  	/* Add probe name elements to usdt_names map. */
> >  	p = probnam;
> > @@ -686,11 +712,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
> >  	}
> >  
> >  	/* Add prid and bit mask to usdt_prids map. */
> > +	val = alloca(sizeof(usdt_prids_map_val_t) + dtp->dt_usdt_mask_bytes);
> >  	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
> >  		dt_probe_t		*uprp = pup->probe;
> > -		long long		mask = 0, bit = 1;
> > +		uint32_t		iword = 0, mask = 0, bit = 1;
> >  		usdt_prids_map_key_t	key;
> > -		usdt_prids_map_val_t	val;
> >  		dt_uprobe_t		*upp = uprp->prv_data;
> >  
> >  		/*
> > @@ -704,15 +730,24 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
> >  		if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
> >  			int n;
> >  
> > +			/*
> > +			 * The loop over n to dtp->dt_stmt_nextid, skipping
> > +			 * ignore_clause(), should be the same here as in
> > +			 * the trampoline.
> > +			 */
> >  			for (n = 0; n < dtp->dt_stmt_nextid; n++) {
> >  				dtrace_stmtdesc_t *stp;
> >  
> >  				stp = dtp->dt_stmts[n];
> > -				if (stp == NULL)
> > +				if (stp == NULL || ignore_clause(dtp, n, uprp))
> >  					continue;
> >  
> > -				if (ignore_clause(dtp, n, uprp))
> > -					continue;
> > +				if (bit == 0) {
> > +					val->mask[iword] = mask;
> > +					mask = 0;
> > +					iword++;
> > +					bit = 1;
> > +				}
> >  
> >  				if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
> >  				    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
> > @@ -727,11 +762,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
> >  		key.pid = pid;
> >  		key.uprid = uprp->desc->id;
> >  
> > -		val.prid = prp->desc->id;
> > -		val.mask = mask;
> > +		val->prid = prp->desc->id;
> > +		val->mask[iword] = mask;
> >  
> >  		// FIXME Check return value, but how should errors be handled?
> > -		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
> > +		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, val);
> >  	}
> >  
> >  	return 0;
> > @@ -1452,7 +1487,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  	const list_probe_t	*pop;
> >  	uint_t			lbl_exit = pcb->pcb_exitlbl;
> >  	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
> > -	int			n;
> > +	int			n, ibit, w = CHAR_BIT * sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
> >  
> >  	assert(usdt_prids != NULL);
> >  
> > @@ -1539,7 +1574,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  	 */
> >  	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
> >  	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
> > -	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
> > +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP,
> > +		   DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
> >  	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
> >  	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> >  	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> > @@ -1573,8 +1609,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
> >  	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
> >  
> > -	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
> > -	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
> > +	/* Store the value key for reuse. */
> > +	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
> >  
> >  	/*
> >  	 * Apply arg mappings, if needed.
> > @@ -1588,21 +1624,29 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  	/*
> >  	 * Hold the bit mask in %r6 between clause calls.
> >  	 */
> > -	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
> > +	/*
> > +	 * The loop over n to dtp->dt_stmt_nextid, skipping
> > +	 * ignore_clause(), should be the same here as in
> > +	 * add_probe_usdt().
> > +	 */
> > +	for (ibit = n = 0; n < dtp->dt_stmt_nextid; n++) {
> >  		dtrace_stmtdesc_t *stp;
> >  		dt_ident_t	*idp;
> >  		uint_t		lbl_next;
> >  
> >  		stp = dtp->dt_stmts[n];
> > -		if (stp == NULL)
> > -			continue;
> > -
> > -		if (ignore_clause(dtp, n, uprp))
> > +		if (stp == NULL || ignore_clause(dtp, n, uprp))
> >  			continue;
> >  
> >  		idp = stp->dtsd_clause;
> >  		lbl_next = dt_irlist_label(dlp);
> >  
> > +		/* Load the next word of the bit mask into %r6. */
> > +		if (ibit % w == 0) {
> > +			emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
> > +			emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask[ibit / w])));
> > +		}
> > +
> >  		/* If the lowest %r6 bit is 0, skip over this clause. */
> >  		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
> >  		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
> > @@ -1630,6 +1674,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  
> >  		/* Right-shift %r6. */
> >  		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
> > +		ibit++;
> >  	}
> >  
> >  out:
> > diff --git a/test/unittest/usdt/tst.manyprobedescriptions.r b/test/unittest/usdt/tst.manyprobedescriptions.r
> > new file mode 100644
> > index 000000000..2e9ba477f
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.manyprobedescriptions.r
> > @@ -0,0 +1 @@
> > +success
> > diff --git a/test/unittest/usdt/tst.manyprobedescriptions.sh b/test/unittest/usdt/tst.manyprobedescriptions.sh
> > new file mode 100755
> > index 000000000..92a61d5b7
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.manyprobedescriptions.sh
> > @@ -0,0 +1,64 @@
> > +#!/bin/bash
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +
> > +dtrace=$1
> > +TRIGGER=$PWD/test/triggers/usdt-tst-args
> > +
> > +DIRNAME="$tmpdir/usdt-many_probe_descriptions.$$.$RANDOM"
> > +mkdir -p $DIRNAME
> > +cd $DIRNAME
> > +
> > +# Construct the D scripts and output files.
> > +# We stick 80 probe descriptions in each of 3 scripts to test
> > +# USDT's ability to handle hundreds of probe descriptions.
> > +for d in 0 1 2; do
> > +for x in 00 01 02 03 04 05 06 07 08 09 \
> > +         10 11 12 13 14 15 16 17 18 19 \
> > +         20 21 22 23 24 25 26 27 28 29 \
> > +         30 31 32 33 34 35 36 37 38 39 \
> > +         40 41 42 43 44 45 46 47 48 49 \
> > +         50 51 52 53 54 55 56 57 58 59 \
> > +         60 61 62 63 64 65 66 67 68 69 \
> > +         70 71 72 73 74 75 76 77 78 79 \
> > +; do
> > +	echo 'test_prov$target:::place { printf("'$d$x'\n"); }' >> D$d.d
> > +	echo $d$x >> expect.txt
> > +done
> > +done
> > +echo 'test_prov$target:::place { exit(0); }' >> D$d.d
> > +echo >> expect.txt
> > +
> > +# Run DTrace.
> > +
> > +$dtrace $dt_flags -c $TRIGGER -q -s D0.d -s D1.d -s D2.d >& actual.txt
> > +if [ $? -eq 0 ]; then
> > +	if diff -q expect.txt actual.txt > /dev/null; then
> > +		echo success
> > +		exit 0
> > +	else
> > +		echo ERROR: did not get expected results
> > +		echo === expect.txt
> > +		cat      expect.txt
> > +		echo === actual.txt
> > +		cat      actual.txt
> > +		echo === diff
> > +		diff expect.txt actual.txt
> > +	fi
> > +else
> > +	echo ERROR: dtrace error
> > +	echo ==== output
> > +	cat actual.txt
> > +fi
> > +
> > +echo ==== script D0.d
> > +cat D0.d
> > +echo ==== script D1.d
> > +cat D1.d
> > +echo ==== script D2.d
> > +cat D2.d
> > +
> > +exit 1
> > diff --git a/test/unittest/usdt/tst.manyprobedescriptions2.r b/test/unittest/usdt/tst.manyprobedescriptions2.r
> > new file mode 100644
> > index 000000000..2e9ba477f
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.manyprobedescriptions2.r
> > @@ -0,0 +1 @@
> > +success
> > diff --git a/test/unittest/usdt/tst.manyprobedescriptions2.sh b/test/unittest/usdt/tst.manyprobedescriptions2.sh
> > new file mode 100755
> > index 000000000..8001cec0b
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.manyprobedescriptions2.sh
> > @@ -0,0 +1,127 @@
> > +#!/bin/bash
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +
> > +# This test uses many probes and probe descriptions.  Therefore, the
> > +# number of BPF programs to load into the kernel -- dt_bpf_load_prog()
> > +# calling prp->prov->impl->load_prog(), which is dt_bpf_prog_load() --
> > +# and the duration of each load are both increasing.
> > +# @@timeout: 400
> > +
> > +dtrace=$1
> > +
> > +DIRNAME="$tmpdir/usdt-many_probe_descriptions2.$$.$RANDOM"
> > +mkdir -p $DIRNAME
> > +cd $DIRNAME
> > +
> > +# Set the lists.
> > +# - The probes will be foo$x$y.
> > +# - The probe descriptions will be foo$x* and foo*$y, for each $d.
> > +# So if there are nx items in xlist, ny in ylist, and nd in dlist,
> > +# - there will be roughly nx*ny probes
> > +# - there will be roughly (nx+ny)*nd probe descriptions
> > +
> > +xlist="a b c d e f g h i j k l m"
> > +ylist="n o p q r s t u v w x y z"
> > +dlist="0 1 2 3 4 5 6 7 8"
> > +
> > +# Make the trigger:  Preambles.
> > +
> > +echo "provider testprov {" > prov.d
> > +
> > +echo '#include "prov.h"' > main.c
> > +echo 'int main(int argc, char **argv) {' >> main.c
> > +
> > +# Make the trigger:  Loop over the probes.
> > +
> > +for x in $xlist; do
> > +for y in $ylist; do
> > +    echo "probe foo$x$y();" >> prov.d
> > +    echo "TESTPROV_FOO$x$y();" | awk '{ print(toupper($1)) }' >> main.c
> > +done
> > +done
> > +
> > +# Make the trigger:  Epilogues.
> > +
> > +echo "};" >> prov.d
> > +echo "return 0; }" >> main.c
> > +
> > +# Build the trigger.
> > +
> > +$dtrace $dt_flags -h -s prov.d
> > +if [ $? -ne 0 ]; then
> > +	echo "failed to generate header file" >&2
> > +	cat prov.d
> > +	exit 1
> > +fi
> > +$CC $test_cppflags -c main.c
> > +if [ $? -ne 0 ]; then
> > +	echo "failed to compile test" >&2
> > +	cat main.c
> > +	exit 1
> > +fi
> > +$dtrace $dt_flags -G -64 -s prov.d main.o
> > +if [ $? -ne 0 ]; then
> > +	echo "failed to create DOF" >&2
> > +	exit 1
> > +fi
> > +$CC $test_ldflags -o main main.o prov.o
> > +if [ $? -ne 0 ]; then
> > +	echo "failed to link final executable" >&2
> > +	exit 1
> > +fi
> > +
> > +# Prepare the D script, generating the probe descriptions.
> > +
> > +rm -f D.d
> > +for d in $dlist; do
> > +	for x in $xlist; do
> > +		echo 'testprov$target:::foo'$x'* { printf("'$d' '$x'* %s\n", probename) }' >> D.d
> > +	done
> > +	for y in $ylist; do
> > +		echo 'testprov$target:::foo*'$y' { printf("'$d' *'$y' %s\n", probename) }' >> D.d
> > +	done
> > +done
> > +
> > +# Prepare the expected output.
> > +
> > +for x in $xlist; do
> > +for y in $ylist; do
> > +for d in $dlist; do
> > +	echo $d $x'*' foo$x$y >> expect.txt
> > +	echo $d '*'$y foo$x$y >> expect.txt
> > +done
> > +done
> > +done
> > +echo >> expect.txt
> > +
> > +# Run DTrace.
> > +
> > +$dtrace $dt_flags -c ./main -qs D.d >& actual.txt
> > +if [ $? -ne 0 ]; then
> > +	echo ERROR: dtrace error
> > +	echo "==== D script"
> > +	cat D.d
> > +	echo "==== output"
> > +	cat actual.txt
> > +	exit 1
> > +fi
> > +
> > +# Check results.
> > +
> > +if diff -q expect.txt actual.txt; then
> > +	echo success
> > +	exit 0
> > +else
> > +	echo ERROR: unexpected results
> > +	echo "==== expect"
> > +	cat expect.txt
> > +	echo "==== actual"
> > +	cat actual.txt
> > +	echo "==== diff"
> > +	diff expect.txt actual.txt
> > +	exit 1
> > +fi
> > -- 
> > 2.43.5
> > 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
