Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED091D54F4
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 03:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737690495; cv=fail; b=FrAn/X4Uw+StF2zLiG23c5X0honlaB7SlEEXOKVcQ+PjtMz6gMdR9DduYAjnzv8iDSNvHcvbzxosZDkmtuIpDQAj3Phw7cFRf0VkAhki5EINstYtVPerbWfo7maPnlePnOC7aw2cXYNC/Vj1iGte3yxs6O9CGEN3CIJP4yrKd2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737690495; c=relaxed/simple;
	bh=qMNVo8fPRcCLrgqv/bh7z6G2iiKWuS9FxEZimnOSIpg=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=SNs7DDzbYnh8h1ok8ZU8O6NDDRxN/SP/f30MPZmOjNLP00bYvwToJBGmqD7xkQKvUe/kDW4s5qfcmB+ulEG2CuKlSO6vuoHIbuQh60NbVFoegM06DWRQLq9Q/sM8psmqAYG/t1d8wgOH6B7wS14j/q19W6jQAeyDH0BVlzMeIHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ibgFl5zo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dqns7kFY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ibgFl5zo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dqns7kFY"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O2NgAf029258
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 03:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=YwPznu6ApuBdyDiMb2Jb9s7VG0ixRhDoEuR5me4UiH4=; b=
	ibgFl5zokPBrhEUd1L3so4kwp4bLRN76yfTG/Qko551nvOldHB5HAgPi/2/3vdrZ
	ire11cJeIG3uXyN9cOcUGB96F91XmfMPXj5M7WiDIgIjvCbTEUg8WHjzx3DCxU2f
	g4zb3gvsFLKRt3CWz1S1FRMZj3VTWCMc2ct6CXI/cM6iTqfuVDcklDt7SpIdG9HV
	2txm5zFKWB+dERhjbEpvCJwPN03wstHR04/L6HpIqSEkm2thKbYt25MXyUlA8fEY
	iYttvxJeCJGpLbV69tjGBlNKv25bPU0iXVl3djWIQNEvcxzRw4lOeIo81JUfdM/i
	j94CNHs9U3TZtJICRQhBGA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44b96ajgrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 03:48:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50O0Ummf036437
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 03:48:09 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44917t10n1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 03:48:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+Xfg2fowFnQAAr49s+L8A7ZQKXEjzzGuntR1M2MVin89CMahUmN68RzR0DXEuPoj82Q9yI9tTCkG1T1Lv3E1Nm/T1cwaDHBllBfJUY9slRY/dmOmLhmkyF+n9ccE8erpnB1nklBHIEhAImtWFwzXEO5rmI8/yVMKcKjUtr6SxfVv+TSbTYzeoSDe6k7uPPza2ddapkcv+dzalwDuAb4YqbwJP3ET/jqqOoCEpj+DRc9GqiVz17aOOaCqAhhjDMZiBaQ9G4zEx0YEqxr0YtPM2kQryX7C9q6DgwdLYdU58G6iEv0NdgZuRco9tsh5XEqu0eeGdockoo7JyWniwbtVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwPznu6ApuBdyDiMb2Jb9s7VG0ixRhDoEuR5me4UiH4=;
 b=DUQ8JPrYxSQPH509Hgb5zgCyMH9+X/W279TlO2miU5cM6cVkjCFycLUTh4A7O/pIxI8W3s6HUoxwcELEHX1DnGggoGmqQ0GAMxJdepXDXrUUjIzVSiOSOPANIpGzgGFa/1izBzK/QAwaZiXcDI/4lr2ivhzu25yJhwqVhBOJQDKunmvCIYyhnScf6aoxxSlNl2J4AVq+D0mrG1EL7HCDzk8bV3Q7UZ2hA460i8zmk6LWSFm/LPeppa3zBJmYwzP0J4ubzY7Q3Rn7FgEYZ1JxsMu41BhgNaZLY4/7a9KUBeXE2DPIAcIw3jHTuHxfCq9xiPtz9hBOyCO3Twcmvxwk9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwPznu6ApuBdyDiMb2Jb9s7VG0ixRhDoEuR5me4UiH4=;
 b=dqns7kFYVtq7/r1m0eoQZ984W5ltoY+nzJbhS5FYuWBmcO6tHeEzVLhjQ9AqPJgnep10eqZdrtMQ5Cl7VJj7nLQXGnMemhyWqmJ7EAkDAzg3yo5/lykCYoE68OTsCQ39U+JmUs0DlzC7MEuJFnzy71bPfOpmfiCdjDaSn4b9nhg=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CY5PR10MB6022.namprd10.prod.outlook.com (2603:10b6:930:3e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 03:48:06 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 03:48:06 +0000
Date: Thu, 23 Jan 2025 22:48:05 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] bpf: separate bvar implementation into separate functions
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Message-ID:
 <PH8PR10MB6337FA3F91721239230015A6C2E32@PH8PR10MB6337.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CY5PR10MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ad37e4-7ab5-4c30-830a-08dd3c29e946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lLgKkSONdu69nL6WGNrnEf3yhEFuu+y+ArpK8QUaVXPHCzJN8et1dd/GasU1?=
 =?us-ascii?Q?275751gNJOgvMf+PLXTAZvPkuK3kRWdL2wr0mcqP8HAR5xwwxxCVQsq432nG?=
 =?us-ascii?Q?FZfgIqOtZ8vJ4HfoFpVH1JWvdV5NFIriDJpHR/7IJseqv7LjqfkAkqt9pNhK?=
 =?us-ascii?Q?aP8DoRMvMUoWxxNym+z7pYA4EUQZsfFlfA5sjEXF2O8OPLrnF7/bStGaImjO?=
 =?us-ascii?Q?DaKQOJfSq3bbKu4Pnbon2ERxGlM1fRlCh6JZozr0Fyh6tHvr1M0gWsubcEDy?=
 =?us-ascii?Q?qONKq0NHCzjwFmJwRUnOFG9KPnIsOVqtrg9bBwjHfR+154hZHRdVmEjyXOqg?=
 =?us-ascii?Q?uHM9TjAckeo3BUCbfmSpj8UQ1Z9l/l4CKCdnmtstpnN1x0web183B2qsMk7u?=
 =?us-ascii?Q?IamJuXZAgsNWgvm8wAWtwOdHjrEKzWLeS+HcRAWcodrdQ0xrDMVPP4caCiOA?=
 =?us-ascii?Q?yY9BHmuvtXx5i59IeIIRrDtVKwsIahc9YNu+2UYAVBn1ujbrzGL5q3f6MI97?=
 =?us-ascii?Q?i2rlu1zHydHWpdKplSbI1ZceDu2QuRh3sNOp7MiyYixi3TwqnCoxEaxLNkpI?=
 =?us-ascii?Q?DZTVOS99TY+NI0cczPc0qxZCbZG/EjKcMzmome1S3tqDeqRlgkQ/Q3tKEONf?=
 =?us-ascii?Q?fTpUIu8tQGbaKi8MAeq3GxgryzA/fs+drqm++vNbzTFsDn/pjjgSbM28JYt3?=
 =?us-ascii?Q?SYOVX7MdpCN/DbPelJuptBY1WI1H6NWnNwzsrNmgt4AIb0C/7+iNUA5oT33O?=
 =?us-ascii?Q?8dnMgimfgIqsoaMYQ1ZCQrdSZW9UnuCqjBv/NLjV9zcENH/0XORGOMct1aVy?=
 =?us-ascii?Q?keX7vM3iBqQyWlGpqVg0yu/J6LrBQU5ruq/TdYjIpNmD+PflisqknTyFzqt4?=
 =?us-ascii?Q?Eo1Y81CGEFLmY7StxZKfuPgMAzNKwgFBkA/TBJ8kOM2uC0jVopTjmXrpi8rd?=
 =?us-ascii?Q?3AMipLtgcuZWL+Kxk3HpP1WCevGDz7tcYcm2YJ8N/iLZKM0pz3aOXXyIcvxQ?=
 =?us-ascii?Q?Qncchx1jLCx/TGt/QujJ4aFPzYoKnv/KkHhNAOLIQa1t4GJ9Hdoi0nXz7LYL?=
 =?us-ascii?Q?YM9XBhVTuvvUfhCwT9r/G3aEzZ4bedykzp7bbjJfPQgCfxA6tLQSQJg7j8oj?=
 =?us-ascii?Q?4lj4jTt5VZoSkW5OGxPjN5l71fEIVzyXsMPoHQH/VajcNjkHEJt2/PREZqKQ?=
 =?us-ascii?Q?s/OONpwDU2HrMx+bPrxUWFuv3CsvAfyzVyidsbXklK8Su58axbLlQeXj8g9L?=
 =?us-ascii?Q?0DDfF25ovxoQuKm3aIb5TJI6/j57ESDeAdWdBMnQ75edjRHtyMZxs6E0d6fF?=
 =?us-ascii?Q?TAHUbKXnbA4KmUMmSQ1bqlXBllMSwlhruiXX3MJ5F8xJJQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aUjHyoWHlA00GOkfzw5ynKAZ1Fpt4xPO9y4KE29vj9JEtJGycg9O7kBKB4LJ?=
 =?us-ascii?Q?KlCDUcBc6Lh6qt851DCzoZxYD1kOI17O21ZxA9Knbp0AHY+DF4Ql6NrFoYwT?=
 =?us-ascii?Q?zl3KoFDfLdhGqMdwWtJo2sEJq0q+MZSuWxSjRRKqpj0yT1ag0U+7fjx1I1be?=
 =?us-ascii?Q?jBG5n2JRSyrO7h5Ggmw9/ZPN2nR7sD+R1KGsjrAXatZ2JeTweVOt+GKZ+l4S?=
 =?us-ascii?Q?MVzNA/D49gZyHqig2/tKxm2kjSLtUBx0ewrZcSfKOsEJOHpZTbzBOKcn5ZgH?=
 =?us-ascii?Q?Zb5muzz9BTPFoiFws+/ZxFaRnSriAJDMh3FlGUYY2KwceSkooql+QCFgNm4Y?=
 =?us-ascii?Q?gDs2BnkZyiQ/+VX32Cvf+209x8qY0x88L/L585NihVqL1lKnecA4u0904xLn?=
 =?us-ascii?Q?yZN2HAGXYUrPbKVRO+NBbRxIlfmMNBUZuOB6HJwHBDfww07dHMhuXtqdAHG6?=
 =?us-ascii?Q?+BHuF0VKmS19svn8OfupTzI3vmwFcEQAhpkVfRI+RUtXtcub+nqLBw65f1wY?=
 =?us-ascii?Q?1tFxnc7iou5Eue/9z75iyuT3fS36L+FSYHPTJapCAlyVTA7dlbGzUjTJ4a5d?=
 =?us-ascii?Q?xWz3QPM4y6V/ZJettUcjRxJ2rVNBbtnAG9sZuJVLlTT0MZ83KZk6SLZ2jkIm?=
 =?us-ascii?Q?+xn55ET5Woz434pozkQtZPmBx/pco0Nbv451D9cekg/gRSl25OcgzH+N/Z/m?=
 =?us-ascii?Q?RjjxtQ2JsKWeCwrP284RvhgqRjcLh/TL+IizJPXoa3cat28VoWDjrOjQbcL7?=
 =?us-ascii?Q?Oz4WbhkopQWxcKrcVpOKnMG1HgtACCa7SluHdN7o0T8ruHHQSgejEJF6krt8?=
 =?us-ascii?Q?+n2sZoV75xL0RsQWKvsRWMpkb9XbS10v6g7DMO9peqzgYf80Ep42dWb4Nr1t?=
 =?us-ascii?Q?nqhLXpBAOykDFToaNpqEdX30ncbQNxv8QrFO5kY268xQqncVCQbpg9xVVZYM?=
 =?us-ascii?Q?vrT4dnPie1Z9iVPnkDSnlPA5X7QEBozjgEKT2TEub6HQd+HeJa00C7G8L8IT?=
 =?us-ascii?Q?snS1ZVKzjbPbwrfqsRq8QH8HNWUzCSagCJGT8oH0sGTrEJ/t0v0584RyOvw5?=
 =?us-ascii?Q?ToySyStgaYwS93v9nT/UddN71yoKTjM/0RyV6eG6OxxgOJD/DHsYzxZmoIB/?=
 =?us-ascii?Q?F+mfKEm8Pa5Fves72mY0ox8/wTwXrc8Rj8YAoA4Bej5CZ8QT/A3lQIAKfntE?=
 =?us-ascii?Q?1JPKIJczgT/xqvGhpwAy07X7vUfrJl1siocMTHu38mRu529Mu7nD3x+ts+KQ?=
 =?us-ascii?Q?UkcKbiaK7aSGJD89FBvKoQUaex9a+c3SBGpcq9MLumTLkFZGAXxSE0Jk8svV?=
 =?us-ascii?Q?6BWHrfTpLpgsiMV7VEE2xQxBubInW1569MQ53/lcVg9tVQruWK+7uXuWWJ0e?=
 =?us-ascii?Q?BE22yXas0RSeD1HDe0uu8l11PwjAS24Y0WkFi4W2lscClnHBt8qSmp6/JJLB?=
 =?us-ascii?Q?h+eT21Moh7rJpV75rK98a/SNzE7CU2Ls7tffj2hJPOlGUq/iViFXNFAoqLeR?=
 =?us-ascii?Q?aIESffixp/MpBUSehXrP48SiVc47fZKIIgIC6s+91646MpvsDBV8k3GD58mp?=
 =?us-ascii?Q?9ps00eZCyQ7iZ2EnZTR9bCnbXaNrhYggrndIuoniDvbcGwIr55zMYXoKf4CY?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	msVrOtExVBvnC+BmUK9iMzgV+PEJUFCTlZscX7v/6QrE7j4FhJghyCzaYdKWrvO3mr4b1j5CwklLK1ixiX6muE8hZ7ESZc2A5aDIvay/OsaouEycJtecSiSbt1LFlnhacRbK1yQ58fSn/shiW3bnzWlcuXlLnNQFs642eWAvhDrvqyd4SdvWy89lC7Jtao1g7fdIMfrJsqytVY/pDPsA5FCQni8k5Gev1YLOTaQ6z4jkU7hw34TKq6pvsR5qYAXAlQ+ToAu8upCIkGrURXbaChWvIE1rpORgax05j5iXAzoFz/glAPC7X/YBiAB9Zh1YIJyTQ3aZZ4pRIjWG0HyNP2hCw7135b5m/NrEXBsB9EQnUvoRP3bklR5fbbvdQCiwBQZLKHlJePwNXrDh1DnHb1e/8KLlPat+ZDEvpOCB+CWPSOiR53eWmTIiU4w+SiaSgxujZ5odB2CS4+KjUCKcQrrISZGCiCFJqa7ton0LW9JXkWlOuYHOCgMBq5Q49fpzH+wlI3RzhtXvv2pQOXcoWeoXKHWRb0WaHfWQVb0MNIryF2/NCKVpYBy75Fi5bgNeforh1FnngusUTy1P5fwo+dFwkdmsgLCBeHmoTxf5q4Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ad37e4-7ab5-4c30-830a-08dd3c29e946
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 03:48:06.3159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1he5IzbbqmKABU11w5UJQ6CZZjc8nt1GfI5SbWagMdp4Q9JnbPj9W6++WcTQyejK6HjicrvZjxa0ESixJw+KSF19/hwx5VajSoyfG2cZMJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6022
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501240025
X-Proofpoint-GUID: 64fjqyfJZKbzMeSiuBCkk-6dC18oW58w
X-Proofpoint-ORIG-GUID: 64fjqyfJZKbzMeSiuBCkk-6dC18oW58w

The handling of builtin variables was done with a single big function
that therefore got linked into every single BPF program (twice if the
builtin variable might raise a fault).  Providing separate functions
for most builtin variables reduces BPF program size significantly.

This also reduces pressure on the BPF verifies.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/get_bvar.c                          | 412 +++++++++++++-----------
 include/dtrace/dif_defines.h            |   1 +
 libdtrace/dt_cg.c                       |  39 ++-
 libdtrace/dt_dis.c                      |  57 +++-
 libdtrace/dt_open.c                     |   2 +
 test/demo/builtin/ipl.d                 |   2 +
 test/demo/builtin/vtimestamp.d          |   2 +
 test/demo/io/iocpu.d                    |   2 +
 test/unittest/buffering/tst.cputime.sh  |   1 +
 test/unittest/disasm/tst.ann-bvar.r     |  69 ++--
 test/unittest/disasm/tst.ann-bvar.sh    |   9 +-
 test/unittest/disasm/tst.vartab-bvar.r  |   2 -
 test/unittest/disasm/tst.vartab-bvar.sh |   7 +-
 13 files changed, 360 insertions(+), 245 deletions(-)

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index 1c0fa884..c760126d 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -19,18 +19,21 @@
 # define noinline	__attribute__((noinline))
 #endif
 
-extern struct bpf_map_def cpuinfo;
-extern struct bpf_map_def probes;
-extern struct bpf_map_def state;
-extern struct bpf_map_def usdt_names;
-
-extern uint64_t PC;
-extern uint64_t STBSZ;
-extern uint64_t STKSIZ;
-extern uint64_t BOOTTM;
+extern struct bpf_map_def	cpuinfo;
+extern struct bpf_map_def	probes;
+extern struct bpf_map_def	state;
+extern struct bpf_map_def	usdt_names;
+
+extern uint64_t	BOOTTM;
+extern uint64_t	NPROBES;
+extern uint64_t	PC;
+extern uint64_t	STBSZ;
+extern uint64_t	STKSIZ;
 extern uint64_t STACK_OFF;
-extern uint64_t STACK_SKIP;
-extern uint64_t NPROBES;
+extern uint64_t	STACK_SKIP;
+extern uint64_t	TASK_COMM;
+extern uint64_t	TASK_REAL_PARENT;
+extern uint64_t	TASK_TGID;
 
 #define error(dctx, fault, illval) \
 	({ \
@@ -38,198 +41,231 @@ extern uint64_t NPROBES;
 		-1; \
 	})
 
-noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
+noinline uint64_t dt_bvar_args(const dt_dctx_t *dctx, uint32_t idx)
 {
 	dt_mstate_t	*mst = dctx->mst;
 
-	switch (id) {
-	case DIF_VAR_CURTHREAD:
-		return bpf_get_current_task();
-	case DIF_VAR_TIMESTAMP:
-		if (mst->tstamp == 0)
-			mst->tstamp = bpf_ktime_get_ns();
+	if (idx >= sizeof(mst->argv) / sizeof(mst->argv[0]))
+		return error(dctx, DTRACEFLT_ILLOP, 0);
 
-		return mst->tstamp;
-	case DIF_VAR_EPID: {
-		return (((uint64_t)mst->prid) << 32) | mst->stid;
-	}
-	case DIF_VAR_ID:
-		return mst->prid;
-	case DIF_VAR_ARG0: case DIF_VAR_ARG1: case DIF_VAR_ARG2:
-	case DIF_VAR_ARG3: case DIF_VAR_ARG4: case DIF_VAR_ARG5:
-	case DIF_VAR_ARG6: case DIF_VAR_ARG7: case DIF_VAR_ARG8:
-	case DIF_VAR_ARG9:
-		return mst->argv[id - DIF_VAR_ARG0];
-	case DIF_VAR_ARGS:
-		if (idx >= sizeof(mst->argv) / sizeof(mst->argv[0]))
-			return error(dctx, DTRACEFLT_ILLOP, 0);
-
-		return mst->argv[idx];
-	case DIF_VAR_STACKDEPTH:
-	case DIF_VAR_USTACKDEPTH: {
-		uint32_t bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
-		uint64_t flags;
-		char *buf = dctx->mem + (uint64_t)(&STACK_OFF);
-		uint64_t stacksize;
-
-		if (id == DIF_VAR_USTACKDEPTH)
-			flags = BPF_F_USER_STACK;
-		else
-			flags = (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK;
-
-		stacksize = bpf_get_stack(dctx->ctx, buf, bufsiz, flags);
-		if (stacksize < 0)
-			return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
+	return mst->argv[idx];
+}
+
+noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
+{
+	uint64_t	buf[2] = { 0, };
 
+	if (bpf_get_stack(dctx->ctx, buf, sizeof(buf),
+			  (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK) < 0)
+		return 0;
+
+	return buf[1];
+}
+
+noinline uint64_t dt_bvar_curcpu(const dt_dctx_t *dctx)
+{
+	uint32_t	key = 0;
+	void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
+
+	if (val == NULL) {
 		/*
-		 * While linux/bpf.h does not describe the meaning of
-		 * bpf_get_stack()'s return value outside of its sign,
-		 * it is presumably the length of the copied stack.
-		 *
-		 * If stacksize==bufsiz, presumably the stack is larger than
-		 * what we can retrieve.  But it's also possible that the
-		 * buffer was exactly large enough.  So, leave it to the user
-		 * to interpret the result.
+		 * Typically, we would use 'return error(...);' but
+		 * that confuses the verifier because it returns -1.
+		 * So, instead, we explicitly return 0.
 		 */
-		return stacksize / sizeof(uint64_t);
-	}
-	case DIF_VAR_CALLER:
-	case DIF_VAR_UCALLER: {
-		uint64_t flags;
-		uint64_t buf[2] = { 0, };
-
-		if (id == DIF_VAR_UCALLER)
-			flags = BPF_F_USER_STACK;
-		else
-			flags = (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK;
-
-		if (bpf_get_stack(dctx->ctx, buf, sizeof(buf), flags) < 0)
-			return 0;
-		return buf[1];
+		error(dctx, DTRACEFLT_ILLOP, 0);
+		return 0;
 	}
-	case DIF_VAR_PROBEPROV:
-	case DIF_VAR_PROBEMOD:
-	case DIF_VAR_PROBEFUNC:
-	case DIF_VAR_PROBENAME: {
-		uint32_t	key = mst->prid;
-
-		if (key < ((uint64_t)&NPROBES)) {
-			dt_bpf_probe_t	*pinfo;
-			uint64_t	off;
-
-			pinfo = bpf_map_lookup_elem(&probes, &key);
-			if (pinfo == NULL)
-				return (uint64_t)dctx->strtab;
-
-			switch (id) {
-			case DIF_VAR_PROBEPROV:
-				off = pinfo->prv;
-				break;
-			case DIF_VAR_PROBEMOD:
-				off = pinfo->mod;
-				break;
-			case DIF_VAR_PROBEFUNC:
-				off = pinfo->fun;
-				break;
-			case DIF_VAR_PROBENAME:
-				off = pinfo->prb;
-			}
-			if (off > (uint64_t)&STBSZ)
-				return (uint64_t)dctx->strtab;
-
-			return (uint64_t)(dctx->strtab + off);
-		} else {
-			char *s;
-
-			s = bpf_map_lookup_elem(&usdt_names, &key);
-			if (s == NULL)
-				return (uint64_t)dctx->strtab;
-
-			switch (id) {
-			case DIF_VAR_PROBENAME:
-				s += DTRACE_FUNCNAMELEN;
-			case DIF_VAR_PROBEFUNC:
-				s += DTRACE_MODNAMELEN;
-			case DIF_VAR_PROBEMOD:
-				s += DTRACE_PROVNAMELEN;
-			case DIF_VAR_PROBEPROV:
-			}
-
-			return (uint64_t)s;
-		}
-	}
-	case DIF_VAR_PID: {
-		uint64_t	val = bpf_get_current_pid_tgid();
 
-		return val >> 32;
-	}
-	case DIF_VAR_TID: {
-		uint64_t	val = bpf_get_current_pid_tgid();
+	return (uint64_t)val;
+}
 
-		return val & 0x00000000ffffffffUL;
-	}
-	case DIF_VAR_EXECNAME: {
-		uint64_t	ptr;
-		extern uint64_t	TASK_COMM;
+noinline uint64_t dt_bvar_curthread(const dt_dctx_t *dctx)
+{
+	return bpf_get_current_task();
+}
 
-		/* &(current->comm) */
-		ptr = bpf_get_current_task();
-		if (ptr == 0)
-			return error(dctx, DTRACEFLT_BADADDR, ptr);
+noinline uint64_t dt_bvar_epid(const dt_dctx_t *dctx)
+{
+	dt_mstate_t	*mst = dctx->mst;
 
-		return (uint64_t)ptr + (uint64_t)&TASK_COMM;
-	}
-	case DIF_VAR_WALLTIMESTAMP:
-		return bpf_ktime_get_ns() + ((uint64_t)&BOOTTM);
-	case DIF_VAR_PPID: {
-		uint64_t	ptr;
-		int32_t		val = -1;
-		extern uint64_t	TASK_REAL_PARENT;
-		extern uint64_t	TASK_TGID;
-
-		/* Chase pointers val = current->real_parent->tgid. */
-		ptr = bpf_get_current_task();
-		if (ptr == 0)
-			return error(dctx, DTRACEFLT_BADADDR, ptr);
-		if (bpf_probe_read((void *)&ptr, 8,
-		    (const void *)(ptr + (uint64_t)&TASK_REAL_PARENT)))
-			return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_REAL_PARENT);
-		if (bpf_probe_read((void *)&val, 4,
-		    (const void *)(ptr + (uint64_t)&TASK_TGID)))
-			return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_TGID);
-
-		return (uint64_t)val;
-	}
-	case DIF_VAR_UID: {
-		uint64_t	val = bpf_get_current_uid_gid();
+	return (((uint64_t)mst->prid) << 32) | mst->stid;
+}
 
-		return val & 0x00000000ffffffffUL;
-	}
-	case DIF_VAR_GID: {
-		uint64_t	val = bpf_get_current_uid_gid();
+noinline uint64_t dt_bvar_errno(const dt_dctx_t *dctx)
+{
+	dt_mstate_t	*mst = dctx->mst;
 
-		return val >> 32;
-	}
-	case DIF_VAR_ERRNO:
-		return mst->syscall_errno;
-	case DIF_VAR_CURCPU: {
-		uint32_t	key = 0;
-		void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
-
-		if (val == NULL) {
-			/*
-			 * Typically, we would use 'return error(...);' but
-			 * that confuses the verifier because it returns -1.
-			 * So, instead, we explicitly return 0.
-			 */
-			error(dctx, DTRACEFLT_ILLOP, 0);
-			return 0;
+	return mst->syscall_errno;
+}
+
+noinline uint64_t dt_bvar_execname(const dt_dctx_t *dctx)
+{
+	uint64_t	ptr;
+
+	/* &(current->comm) */
+	ptr = bpf_get_current_task();
+	if (ptr == 0)
+		return error(dctx, DTRACEFLT_BADADDR, ptr);
+
+	return (uint64_t)ptr + (uint64_t)&TASK_COMM;
+}
+
+noinline uint64_t dt_bvar_gid(const dt_dctx_t *dctx)
+{
+	return bpf_get_current_uid_gid() >> 32;
+}
+
+noinline uint64_t dt_bvar_id(const dt_dctx_t *dctx)
+{
+	dt_mstate_t	*mst = dctx->mst;
+
+	return mst->prid;
+}
+
+noinline uint64_t dt_bvar_pid(const dt_dctx_t *dctx)
+{
+	return bpf_get_current_pid_tgid() >> 32;
+}
+
+noinline uint64_t dt_bvar_ppid(const dt_dctx_t *dctx)
+{
+	uint64_t	ptr;
+	int32_t		val = -1;
+
+	/* Chase pointers val = current->real_parent->tgid. */
+	ptr = bpf_get_current_task();
+	if (ptr == 0)
+		return error(dctx, DTRACEFLT_BADADDR, ptr);
+	if (bpf_probe_read((void *)&ptr, 8,
+			   (const void *)(ptr + (uint64_t)&TASK_REAL_PARENT)))
+		return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_REAL_PARENT);
+	if (bpf_probe_read((void *)&val, 4,
+			   (const void *)(ptr + (uint64_t)&TASK_TGID)))
+		return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_TGID);
+
+	return (uint64_t)val;
+}
+
+noinline uint64_t dt_bvar_probedesc(const dt_dctx_t *dctx, uint32_t idx)
+{
+	dt_mstate_t			*mst = dctx->mst;
+	uint32_t			key = mst->prid;
+
+	if (key < ((uint64_t)&NPROBES)) {
+		dt_bpf_probe_t	*pinfo;
+		uint64_t	off = 0;
+
+		pinfo = bpf_map_lookup_elem(&probes, &key);
+		if (pinfo == NULL)
+			return (uint64_t)dctx->strtab;
+
+		switch (idx) {
+		case DIF_VAR_PROBEPROV:
+			off = pinfo->prv;
+			break;
+		case DIF_VAR_PROBEMOD:
+			off = pinfo->mod;
+			break;
+		case DIF_VAR_PROBEFUNC:
+			off = pinfo->fun;
+			break;
+		case DIF_VAR_PROBENAME:
+			off = pinfo->prb;
 		}
+		if (off > (uint64_t)&STBSZ)
+			return (uint64_t)dctx->strtab;
 
-		return (uint64_t)val;
-	}
-	default:
-		/* Not implemented yet. */
-		return error(dctx, DTRACEFLT_ILLOP, 0);
+		return (uint64_t)(dctx->strtab + off);
+	} else {
+		char	*s;
+
+		s = bpf_map_lookup_elem(&usdt_names, &key);
+		if (s == NULL)
+			return (uint64_t)dctx->strtab;
+
+		switch (idx) {
+		case DIF_VAR_PROBEPROV:
+			s += DTRACE_FUNCNAMELEN;
+		case DIF_VAR_PROBEMOD:
+			s += DTRACE_MODNAMELEN;
+		case DIF_VAR_PROBEFUNC:
+			s += DTRACE_PROVNAMELEN;
+		case DIF_VAR_PROBENAME:
+		}
+
+		return (uint64_t)s;
 	}
 }
+
+noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
+{
+	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
+	char		*buf = dctx->mem + (uint64_t)(&STACK_OFF);
+	uint64_t	retv;
+
+	retv = bpf_get_stack(dctx->ctx, buf, bufsiz,
+			     (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK);
+	if (retv < 0)
+		return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
+
+	/*
+	 * While linux/bpf.h does not describe the meaning of bpf_get_stack()'s
+	 * return value outside of its sign, it is presumably the length of the
+	 * copied stack.
+	 *
+	 * If retv==bufsiz, presumably the stack is larger than what we
+	 * can retrieve.  But it's also possible that the buffer was exactly
+	 * large enough.  So, leave it to the user to interpret the result.
+	 */
+	return retv / sizeof(uint64_t);
+}
+
+noinline uint64_t dt_bvar_tid(const dt_dctx_t *dctx)
+{
+	return bpf_get_current_pid_tgid() & 0x00000000ffffffffUL;
+}
+
+noinline uint64_t dt_bvar_timestamp(const dt_dctx_t *dctx)
+{
+	dt_mstate_t	*mst = dctx->mst;
+
+	if (mst->tstamp == 0)
+		mst->tstamp = bpf_ktime_get_ns();
+
+	return mst->tstamp;
+}
+
+noinline uint64_t dt_bvar_ucaller(const dt_dctx_t *dctx)
+{
+	uint64_t buf[2] = { 0, };
+
+	if (bpf_get_stack(dctx->ctx, buf, sizeof(buf), BPF_F_USER_STACK) < 0)
+		return 0;
+
+	return buf[1];
+}
+
+noinline uint64_t dt_bvar_uid(const dt_dctx_t *dctx)
+{
+	return bpf_get_current_uid_gid() & 0x00000000ffffffffUL;
+}
+
+noinline uint64_t dt_bvar_ustackdepth(const dt_dctx_t *dctx)
+{
+	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
+	char		*buf = dctx->mem + (uint64_t)(&STACK_OFF);
+	uint64_t	retv;
+
+	retv = bpf_get_stack(dctx->ctx, buf, bufsiz, BPF_F_USER_STACK);
+	if (retv < 0)
+		return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
+
+	/* See dt_bvar_stackdepth() above. */
+	return retv / sizeof(uint64_t);
+}
+
+noinline uint64_t dt_bvar_walltimestamp(const dt_dctx_t *dctx)
+{
+	return bpf_ktime_get_ns() + ((uint64_t)&BOOTTM);
+}
diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
index c8c1d961..9f6e3b55 100644
--- a/include/dtrace/dif_defines.h
+++ b/include/dtrace/dif_defines.h
@@ -162,6 +162,7 @@
 #define DIF_VAR_GID		0x011f
 #define DIF_VAR_ERRNO		0x0120
 #define DIF_VAR_CURCPU		0x0121
+#define DIF_VAR_EXECARGS	0x0122
 
 #define DIF_SUBR_RAND			0
 #define DIF_SUBR_MUTEX_OWNED		1
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index e7e3a132..6e74b4b0 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -3197,6 +3197,7 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 {
 	dt_ident_t	*idp = dt_ident_resolve(dnp->dn_ident);
 	dt_ident_t	*fnp;
+	uint32_t	idx = UINT32_MAX;
 
 	idp->di_flags |= DT_IDFLG_DIFR;
 
@@ -3298,15 +3299,38 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 		return;
 	}
 
-	/* built-in variables */
+	/* built-in variables (note: args[] is handled in dt_cg_array_op) */
+	/* Special case for arg0 through arg9; encode as args[n] */
+	if (idp->di_id >= DIF_VAR_ARG0 && idp->di_id <= DIF_VAR_ARG9) {
+		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
+		idx = idp->di_id - DIF_VAR_ARG0;
+	} else if (idp->di_id == DIF_VAR_PROBEPROV ||
+		   idp->di_id == DIF_VAR_PROBEMOD ||
+		   idp->di_id == DIF_VAR_PROBEFUNC ||
+		   idp->di_id == DIF_VAR_PROBENAME) {
+		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_probedesc");
+		idx = idp->di_id;
+	} else {
+		char	*fn;
+
+		if (asprintf(&fn, "dt_bvar_%s", idp->di_name) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
+
+		fnp = dt_dlib_get_func(yypcb->pcb_hdl, fn);
+		free(fn);
+	}
+
+	/* No implementing function found - report ILLOP. */
+	if (fnp == NULL)
+		xyerror(D_IDENT_UNDEF,
+			"built-in variable '%s' not implemented", idp->di_name);
+
 	if (dt_regset_xalloc_args(drp) == -1)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 
 	dt_cg_access_dctx(BPF_REG_1, dlp, drp, -1);
-	emit(dlp, BPF_MOV_IMM(BPF_REG_2, idp->di_id));
-	emit(dlp, BPF_MOV_IMM(BPF_REG_3, 0));
-	fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_get_bvar");
-	assert(fnp != NULL);
+	if (idx != UINT32_MAX)
+		emit(dlp, BPF_MOV_IMM(BPF_REG_2, idx));
 	dt_regset_xalloc(drp, BPF_REG_0);
 	emite(dlp, BPF_CALL_FUNC(fnp->di_id), fnp);
 	dt_regset_free_args(drp);
@@ -5065,7 +5089,7 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	dt_probe_t	*prp = yypcb->pcb_probe;
 	uintmax_t	saved = dnp->dn_args->dn_value;
 	dt_ident_t	*idp = dnp->dn_ident;
-	dt_ident_t	*fidp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_get_bvar");
+	dt_ident_t	*fidp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
 	size_t		size;
 	int		n;
 	int		ustr = 0;
@@ -5135,8 +5159,7 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	if (dt_regset_xalloc_args(drp) == -1)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 	dt_cg_access_dctx(BPF_REG_1, dlp, drp, -1);
-	emit(dlp, BPF_MOV_IMM(BPF_REG_2, idp->di_id));
-	emit(dlp, BPF_MOV_REG(BPF_REG_3, dnp->dn_reg));
+	emit(dlp, BPF_MOV_REG(BPF_REG_2, dnp->dn_reg));
 	dt_regset_xalloc(drp, BPF_REG_0);
 	emite(dlp, BPF_CALL_FUNC(fidp->di_id), fidp);
 	dt_regset_free_args(drp);
diff --git a/libdtrace/dt_dis.c b/libdtrace/dt_dis.c
index 9f319d70..d983c099 100644
--- a/libdtrace/dt_dis.c
+++ b/libdtrace/dt_dis.c
@@ -364,16 +364,57 @@ static char *
 dt_dis_bpf_args(const dtrace_difo_t *dp, const char *fn,
 		const struct bpf_insn *in, char *buf, size_t len, uint_t addr)
 {
-	if (strcmp(fn, "dt_get_bvar") == 0) {
+	if (strcmp(fn, "dt_bvar_args") == 0) {
 		/*
-		 * We know that the previous two instructions exist and move
-		 * the variable id to a register in the first instruction of
-		 * that sequence (because we wrote the code generator to emit
-		 * the instructions in this exact order.)
+		 * We need to support two cases:
+		 *  - access to argN:
+		 *	lddw %r1, dctx
+		 *	mov  %r2, N
+		 *	call dt_bvar_args
+		 *  - access to args[N]:
+		 *	mov  %rX, N
+		 *	lddw %r1, dctx
+		 *	mov  %r2, %rX
+		 *	call dt_bvar_args
 		 */
-		in -= 2;
-		snprintf(buf, len, "%s",
-			 dt_dis_varname_id(dp, in->imm, DIFV_SCOPE_GLOBAL, addr));
+		in--;
+		if (BPF_OP(in->code) == BPF_MOV && in->dst_reg == 2) {
+			if (BPF_SRC(in->code) == BPF_K) {
+				snprintf(buf, len, "arg%d", in->imm);
+				return buf;
+			}
+
+			in -= 2;
+			if (BPF_OP(in->code) == BPF_MOV &&
+			    BPF_SRC(in->code) == BPF_K &&
+			    in->dst_reg == in[2].src_reg) {
+				snprintf(buf, len, "args[%d]", in->imm);
+				return buf;
+			}
+		}
+
+		snprintf(buf, len, "args[?]");
+		return buf;
+	} else if (strcmp(fn, "dt_bvar_probedesc") == 0) {
+		/*
+		 * Access to probe(prov|mod|func|name);
+		 *	lddw %r1, dctx
+		 *	mov  %r2, N
+		 *	call dt_bvar_probedesc
+		 */
+		in--;
+		if (BPF_OP(in->code) == BPF_MOV && in->dst_reg == 2 &&
+		    BPF_SRC(in->code) == BPF_K) {
+			snprintf(buf, len, "%s",
+				 dt_dis_varname_id(dp, in->imm,
+						   DIFV_SCOPE_GLOBAL, addr));
+			return buf;
+		}
+
+		return NULL;
+	} else if (strncmp(fn, "dt_bvar_", 8) == 0) {
+		/* The variable name is in the function name.*/
+		snprintf(buf, len, "%s", fn + 8);
 		return buf;
 	} else if (strcmp(fn, "dt_get_agg") == 0) {
 		/*
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index a0205887..51c056b2 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -153,6 +153,8 @@ static const dt_ident_t _dtrace_globals[] = {
 	&dt_idops_type, "uint64_t" },
 { "errno", DT_IDENT_SCALAR, 0, DIF_VAR_ERRNO, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_type, "int" },
+{ "execargs", DT_IDENT_SCALAR, 0, DIF_VAR_EXECARGS,
+	DT_ATTR_STABCMN, DT_VERS_2_0, &dt_idops_type, "string" },
 { "execname", DT_IDENT_SCALAR, 0, DIF_VAR_EXECNAME,
 	DT_ATTR_STABCMN, DT_VERS_1_0, &dt_idops_type, "string" },
 { "exit", DT_IDENT_ACTFUNC, 0, DT_ACT_EXIT, DT_ATTR_STABCMN, DT_VERS_1_0,
diff --git a/test/demo/builtin/ipl.d b/test/demo/builtin/ipl.d
index ca7f3bb7..f613bb70 100644
--- a/test/demo/builtin/ipl.d
+++ b/test/demo/builtin/ipl.d
@@ -1,3 +1,5 @@
+/* @@xfail: dtv2: need ipl support */
+
 BEGIN {
 	trace(ipl);
 	exit(0);
diff --git a/test/demo/builtin/vtimestamp.d b/test/demo/builtin/vtimestamp.d
index 9f01bbf0..fcb708d0 100644
--- a/test/demo/builtin/vtimestamp.d
+++ b/test/demo/builtin/vtimestamp.d
@@ -1,3 +1,5 @@
+/* @@xfail: dtv2: need vtimestamp support */
+
 BEGIN {
 	trace(vtimestamp);
 	exit(0);
diff --git a/test/demo/io/iocpu.d b/test/demo/io/iocpu.d
index c7b847e7..1230d6f6 100644
--- a/test/demo/io/iocpu.d
+++ b/test/demo/io/iocpu.d
@@ -5,6 +5,8 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
+/* @@xfail: dtv2: need vtimestamp support */
+
 #pragma D option quiet
 
 sched:::on-cpu
diff --git a/test/unittest/buffering/tst.cputime.sh b/test/unittest/buffering/tst.cputime.sh
index 6a420e8d..c0e248a6 100755
--- a/test/unittest/buffering/tst.cputime.sh
+++ b/test/unittest/buffering/tst.cputime.sh
@@ -5,6 +5,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
+# @@xfail: dtv2: need vtimestamp support
 # @@timeout: 12
 
 script()
diff --git a/test/unittest/disasm/tst.ann-bvar.r b/test/unittest/disasm/tst.ann-bvar.r
index b514dd99..a55fb6de 100644
--- a/test/unittest/disasm/tst.ann-bvar.r
+++ b/test/unittest/disasm/tst.ann-bvar.r
@@ -1,34 +1,35 @@
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg0
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg1
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg2
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg3
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg4
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg5
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg6
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg7
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg8
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg9
-85 0 1 0000 ffffffff    call dt_get_bvar              ! args
-85 0 1 0000 ffffffff    call dt_get_bvar              ! caller
-85 0 1 0000 ffffffff    call dt_get_bvar              ! curcpu
-85 0 1 0000 ffffffff    call dt_get_bvar              ! curthread
-85 0 1 0000 ffffffff    call dt_get_bvar              ! epid
-85 0 1 0000 ffffffff    call dt_get_bvar              ! errno
-85 0 1 0000 ffffffff    call dt_get_bvar              ! execname
-85 0 1 0000 ffffffff    call dt_get_bvar              ! gid
-85 0 1 0000 ffffffff    call dt_get_bvar              ! id
-85 0 1 0000 ffffffff    call dt_get_bvar              ! ipl
-85 0 1 0000 ffffffff    call dt_get_bvar              ! pid
-85 0 1 0000 ffffffff    call dt_get_bvar              ! ppid
-85 0 1 0000 ffffffff    call dt_get_bvar              ! probefunc
-85 0 1 0000 ffffffff    call dt_get_bvar              ! probemod
-85 0 1 0000 ffffffff    call dt_get_bvar              ! probename
-85 0 1 0000 ffffffff    call dt_get_bvar              ! probeprov
-85 0 1 0000 ffffffff    call dt_get_bvar              ! stackdepth
-85 0 1 0000 ffffffff    call dt_get_bvar              ! tid
-85 0 1 0000 ffffffff    call dt_get_bvar              ! timestamp
-85 0 1 0000 ffffffff    call dt_get_bvar              ! ucaller
-85 0 1 0000 ffffffff    call dt_get_bvar              ! uid
-85 0 1 0000 ffffffff    call dt_get_bvar              ! ustackdepth
-85 0 1 0000 ffffffff    call dt_get_bvar              ! vtimestamp
-85 0 1 0000 ffffffff    call dt_get_bvar              ! walltimestamp
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg0
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg1
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg2
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg3
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg4
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg5
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg6
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg7
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg8
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg9
+85 0 1 0000 ffffffff    call dt_bvar_args             ! args[0]
+85 0 1 0000 ffffffff    call dt_bvar_args             ! args[1]
+85 0 1 0000 ffffffff    call dt_bvar_args             ! args[2]
+85 0 1 0000 ffffffff    call dt_bvar_args             ! args[3]
+85 0 1 0000 ffffffff    call dt_bvar_caller           ! caller
+85 0 1 0000 ffffffff    call dt_bvar_curcpu           ! curcpu
+85 0 1 0000 ffffffff    call dt_bvar_curthread        ! curthread
+85 0 1 0000 ffffffff    call dt_bvar_epid             ! epid
+85 0 1 0000 ffffffff    call dt_bvar_errno            ! errno
+85 0 1 0000 ffffffff    call dt_bvar_execname         ! execname
+85 0 1 0000 ffffffff    call dt_bvar_gid              ! gid
+85 0 1 0000 ffffffff    call dt_bvar_id               ! id
+85 0 1 0000 ffffffff    call dt_bvar_pid              ! pid
+85 0 1 0000 ffffffff    call dt_bvar_ppid             ! ppid
+85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probefunc
+85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probemod
+85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probename
+85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probeprov
+85 0 1 0000 ffffffff    call dt_bvar_stackdepth       ! stackdepth
+85 0 1 0000 ffffffff    call dt_bvar_tid              ! tid
+85 0 1 0000 ffffffff    call dt_bvar_timestamp        ! timestamp
+85 0 1 0000 ffffffff    call dt_bvar_ucaller          ! ucaller
+85 0 1 0000 ffffffff    call dt_bvar_uid              ! uid
+85 0 1 0000 ffffffff    call dt_bvar_ustackdepth      ! ustackdepth
+85 0 1 0000 ffffffff    call dt_bvar_walltimestamp    ! walltimestamp
diff --git a/test/unittest/disasm/tst.ann-bvar.sh b/test/unittest/disasm/tst.ann-bvar.sh
index 6dc43424..61e838d1 100755
--- a/test/unittest/disasm/tst.ann-bvar.sh
+++ b/test/unittest/disasm/tst.ann-bvar.sh
@@ -22,6 +22,9 @@ sdt:task::task_rename
 	trace(arg8);
 	trace(arg9);
 	trace(args[0]);
+	trace(args[1]);
+	trace(args[2]);
+	trace(args[3]);
 	trace(caller);
 	trace(curcpu);
 	trace(curthread);
@@ -30,7 +33,7 @@ sdt:task::task_rename
 	trace(execname);
 	trace(gid);
 	trace(id);
-	trace(ipl);
+/*	trace(ipl); */
 	trace(pid);
 	trace(ppid);
 	trace(probefunc);
@@ -43,10 +46,10 @@ sdt:task::task_rename
 	trace(ucaller);
 	trace(uid);
 	trace(ustackdepth);
-	trace(vtimestamp);
+/*	trace(vtimestamp); */
 	trace(walltimestamp);
 	exit(0);
 }
-' 2>&1 | gawk '/ call dt_get_bvar/ { sub(/^[^:]+: /, ""); print; }'
+' 2>&1 | gawk '/ call dt_bvar_/ { sub(/^[^:]+: /, ""); print; }'
 
 exit $?
diff --git a/test/unittest/disasm/tst.vartab-bvar.r b/test/unittest/disasm/tst.vartab-bvar.r
index 53e5f618..04fa3a8d 100644
--- a/test/unittest/disasm/tst.vartab-bvar.r
+++ b/test/unittest/disasm/tst.vartab-bvar.r
@@ -2,8 +2,6 @@ NAME             OFFSET KND SCP FLAG TYPE
 args                    arr glb r    any (unknown) by ref (size 0)
 curthread               scl glb r    D type (pointer) (size 8)
 timestamp               scl glb r    D type (integer) (size 8)
-vtimestamp              scl glb r    D type (integer) (size 8)
-ipl                     scl glb r    D type (integer) (size 4)
 epid                    scl glb r    D type (integer) (size 8)
 id                      scl glb r    D type (integer) (size 4)
 arg0                    scl glb r    D type (integer) (size 8)
diff --git a/test/unittest/disasm/tst.vartab-bvar.sh b/test/unittest/disasm/tst.vartab-bvar.sh
index 098c1f45..ce489a24 100755
--- a/test/unittest/disasm/tst.vartab-bvar.sh
+++ b/test/unittest/disasm/tst.vartab-bvar.sh
@@ -30,6 +30,9 @@ sdt:task::task_rename
 	trace(arg8);
 	trace(arg9);
 	trace(args[0]);
+	trace(args[1]);
+	trace(args[2]);
+	trace(args[3]);
 	trace(caller);
 	trace(curcpu);
 	trace(curthread);
@@ -38,7 +41,7 @@ sdt:task::task_rename
 	trace(execname);
 	trace(gid);
 	trace(id);
-	trace(ipl);
+/*	trace(ipl); */
 	trace(pid);
 	trace(ppid);
 	trace(probefunc);
@@ -52,7 +55,7 @@ sdt:task::task_rename
 	trace(uid);
 	/* trace(uregs[0]); */ /* test this separately until uregs[0] works on all kernels */
 	trace(ustackdepth);
-	trace(vtimestamp);
+/*	trace(vtimestamp); */
 	trace(walltimestamp);
 	exit(0);
 }
-- 
2.45.2

