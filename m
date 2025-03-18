Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067CE7E9
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 20:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742330612; cv=fail; b=AtdGrKihW+f/uPwhtTZ2+LTjtTY1IodUR2qMqbSEXwB23/3ZOGnzXLstoTdfHfjqeMSz+OQqb9iK++INi9GZ783KswhTXJoH955vLseYqRr3zb43PzOvpB3/L7GNH0wJTj+ChOiBLb0RHvCmiq5nNFL2tXMXBfgNh28VwPjHNfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742330612; c=relaxed/simple;
	bh=7JanlkvDRe5n78O11RtzzMIexfJalfPXVRXKcNoYeZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e+04YPXXhwrPT6Stwf4oxgT1mXRn4Oe3MFvl+5ZyU4xHhs3lVOGFP4Hi2/oMuzaoiQun99jeBWilNx/OsgdGO8O/BQRBSq9lLg/gjlecryAh7lHnpwOnc4kngcq3fTUpz0p7bo548E+iRaiQBARi3jMRxYEeCT3cbnKD7ejt+DQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G2P2q0c1; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vsUy4+0P reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G2P2q0c1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vsUy4+0P"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IJYgMB019188
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 20:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=YEcwmdln34TWQTMgMLWQSPJqdB9TESCJqEa/Tf2m3tQ=; b=
	G2P2q0c1V379HY1lQghrnCWueLZxxH5ocu5D8reGYQOAG79I0HOLDQDHWfFh8Uj5
	hStFJNgM7w6KhVlX0MkkhARXaOyhOAsKBYfFXNPmwM6C29dTRoyBGQ9R2SqPDVb7
	YKl9DfzWoI3+J4h1XwDOxlKVsQuzb4yqN3i1JyOyjv0ZpE1cFdr3T1oXtu6HX31A
	vFdHwOaCppa4SDebrO7H3mpuLh2LqMrBqfzTCWzok12P5lXpFevY/5+G+9lzJ9Vm
	WIuk0UzoQeZJoyUVixoirHwem4aLKefPeB2kyTygaxbw9JEgSzhKYFvXHGBXaP0C
	zsQYSlk4TS9Hw2L1l0eZBg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1k9x55g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 20:43:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52IKVZ88022414
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 20:43:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxefw80r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 20:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9MJTLVHvFvXXaIgmDPkKINN5YxvF6NRPQ8oVCAK5ETfx0ONzdGe3yYWTZY3SkFVfMBwiFyoHrQ/vmfQ+QMwIgHcp/9c2zlmZFf6ZbUWY86BwInW/GlNeysWkyzUWPlTognQuOeCnnij8EcERMTXBWuiLG30r85ldpW+uvCUVKLLCZilH1VL+tafOaL4gwSd0V3ExZTFBPF9+nzlVWuw+npuu2z82YVE/BeZke8cBrQ3cEpR/G089IVBI4npGfijXbKJASBSsfp/pX71tqv0nbV2wrW0p6V+znZEMnNQxGhKpaWKjdOabZbwAC9NpLs5UUq7bB1tiUc8cQbGPzH+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Emvi4V2dM2Iglu8N9ETDLGuFGiEAPo1ljOjVftJrhms=;
 b=XhcWbcRjeGpUwjm7f7tdWJmu/x3qIb87l9tH9mv7NuWIyhct6xmbqSbj236T9LOfYUnaxCPKrX8YFZeS0XxmYM3fmar+tcz+Qb2bcXnTimSJMLTwCYdk2BFqGYPaQXZn47RbrnC/JYoRjw6dcZwRCBVz2qwxnPbKubBVpMNjAJB5L+IZtzYO94HaQbQ150/vCbpzz40vrUV5WtZZvsQspoR1jjoWlA//C3vQ0O8C2M4QUvdqxicb3YWSrC7qBROPdkLwFJ5Me6qOlRtP7h6oBKcRq0CSqrKg+rJi9WVwVHRx56i5/Q3gg8LNfpP2PReJbmWbo9kT3eIPDIxIv8MtMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Emvi4V2dM2Iglu8N9ETDLGuFGiEAPo1ljOjVftJrhms=;
 b=vsUy4+0PriVM9uwqf+swY268PJjUaj+7y8GqJtwxFu8GEHLX9PbOqXKipQxqKzWOAMO24VcGbxj/4U3qhVRHDWglTFyKfWtieoPqcp666D9dI3iqZWrWjBEaxeMdjn4UfzhQ9M72z25gL6PPDEXOhjFyIR/+mtW4tfUPNsi/maM=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH3PR10MB7396.namprd10.prod.outlook.com (2603:10b6:610:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 20:43:01 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 20:43:01 +0000
Date: Tue, 18 Mar 2025 16:42:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/4] test: Add test for predefined preprocessor
 definitions
Message-ID: <Z9na0viYV3SzQZO3@oracle.com>
References: <20250208190622.23484-1-eugene.loh@oracle.com>
 <20250208190622.23484-4-eugene.loh@oracle.com>
 <Z9nHA1dtjHeo2dy5@kvh-deb-bpf.us.oracle.com>
 <44b61914-f25d-c89c-5d9e-085bbab2fdb6@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44b61914-f25d-c89c-5d9e-085bbab2fdb6@oracle.com>
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH3PR10MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e9ee5c-c5b0-4e24-4ce2-08dd665d7943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ZpJWNAJP+9qCcpzyx9HZG4aIGm8bzMZS7he61UlhjqOloXa9HgfsXcxfT3?=
 =?iso-8859-1?Q?UnKaSUsWJfjKm86miQ265NbMy+HtOA9SgOh06y8ZjBmj4UdQ2u1EHKtjcQ?=
 =?iso-8859-1?Q?ESl8uu5Hp9HJKuLH5uoavUX2cKKQ4cb0E/d5TnJZo8t2lGOGvQHzWGRH6T?=
 =?iso-8859-1?Q?IwOvT5Vr6aApC8X7PXL+MkzMcmcZMIxKWa09pvyA2m9RHHkCF/+WKhzCno?=
 =?iso-8859-1?Q?hOv6X2BYxEihGxzROD4YtOBxMrXpRND4XbIdYmhC115nbbo5yJ7wrOwFXk?=
 =?iso-8859-1?Q?SQhy4ZN/EL8ahhhypnBOGlC7eCtyblWr6I8BvuquRtvkEHDTG61oclsZ0O?=
 =?iso-8859-1?Q?3Z6TGcufmiCI7eALHnDZ5XdJFTf3PvfKi2yXOqzVoCy0+zB8Hatb303SLg?=
 =?iso-8859-1?Q?MnJoEmM2KC7IPGAhMIHXuP7VYzURwaLBeEyxikzZPdgq8+GUqqtowIKBPc?=
 =?iso-8859-1?Q?A1iYjnAOsWXtaPF3AM4WDTbXTfcyJpgQ+9Ptqq92L69NdngmtjDKelfy0e?=
 =?iso-8859-1?Q?2BwN1a/5LVypPJYrLup2zXA4RIJfvf85fySaxDm6Yo6Zs/iDHRDti180zq?=
 =?iso-8859-1?Q?h6vRrlGr31u8FG0xJxuUki17Qn7c/Pt//+8Rm3/AlDGgZVtlQNF7GGFcMn?=
 =?iso-8859-1?Q?QGymwZCjAuwEwqeTt6vD+zJW4oEbhdYjNv6lJL6GtkzkaK+V1WfpPt0ah5?=
 =?iso-8859-1?Q?LivcgOyJelpAC9/uEM/Hs5EY3UuY0fuypgz3FgnVsgObCJFB01m2R6kSYH?=
 =?iso-8859-1?Q?7szwQ1oC5KQF5nN1Nkd2QkaSuOOxseRBOl5xaDRFAKz529+zukOFmgTnAT?=
 =?iso-8859-1?Q?X9lXDU/65elWW1eH+NHe/1CtxW5721SdBJVr0yVzLvPDK7T/6zx/pU+MPu?=
 =?iso-8859-1?Q?VSfQH2rv66LNRIcpG7VpklrbMYF8Z8FmhfnWVpw5PBABtyaTdhmDflai01?=
 =?iso-8859-1?Q?vBoM2ob6LdSub1jTk1kGtgHnxz0/Te1DGSh+/Q+XyBcOO7IWU73Wi2DemZ?=
 =?iso-8859-1?Q?vwJpj/ueK3eoXygOraL0DbUTQT8vLPvfvS6ORXDZYx3l6nBkB5OJZ0n05Q?=
 =?iso-8859-1?Q?6XO6FpF59xe74pQEoggF9VU1IXM1YR68B121kTxZrEYc32V5FPSrfSGr0W?=
 =?iso-8859-1?Q?I9uymloWHrzcu4DGSXq3DhFDm/RgBjDLPjETwTVJnd5THG26LvJowoR7CG?=
 =?iso-8859-1?Q?JC797zFDk/azPXezdnu+OLXhLA99TTBnfDlV4Iv1WNZLfAVHaIOVhfOKbT?=
 =?iso-8859-1?Q?Nv7epCkYCz1w7c8luraJEEGEEIwMRUQSfdVOk/su9GQP4tHk5zMFKJawfR?=
 =?iso-8859-1?Q?KF1ID5yH5c0HdqVeKZ62cv8DS3Tc0J323zDSsmbtYCRzqzzauzAFNAsdQa?=
 =?iso-8859-1?Q?nPKpFwEbSXhRXnuwUQXM2cLBE53cp0ElEnX3EeG9xOwR8k3FrG3QCvwBp0?=
 =?iso-8859-1?Q?AUCcGAg3KehDuzoo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?FAj0iJcVegVbWixWykc7xmWMeleCR2jPBwn+cQHYFmFUwdGKKKwWiC6M6o?=
 =?iso-8859-1?Q?anz/aAE+tNmX9Wj8XHGUJdmJtQlDCp4HFBbMEA23BvN8kHnRAcNTncdX6D?=
 =?iso-8859-1?Q?DGUA//TidSOTEwN9/cbVB0wIqK5gFsq6oGMcYPtDGYnJFoyMfSSa0w4Hee?=
 =?iso-8859-1?Q?QLALpeAuiQVNqzSM8lKzZ4P6OAnsTHJ1+unDbxZPm5jxCZMEgW4kTxpEok?=
 =?iso-8859-1?Q?B6k5fPDtK1NQCVfeapnlZvmy3/SDF/5+NpXJiolgxNUqWoZnJ/vsQru5pd?=
 =?iso-8859-1?Q?sHsUNC1s471Yb+8hS2Mxb80evVKK9nR/C934EjmALjilJpMeKAGDvwRSsT?=
 =?iso-8859-1?Q?fmeKHYiB88r8PvSzll296JMGf0YNyjhmmQoxTw8wRI0nARg9eEFBaTMx6i?=
 =?iso-8859-1?Q?alWhdJs/gBYYxKfeieL9svvpQNDROgD5R0ObdoKgrpKFtvvX30qLYwLV3G?=
 =?iso-8859-1?Q?eFAWx9kABnd9Shz/TatcDDKJZ3KI87B2t8SqppW048/JGH3EbNGrH6wE/g?=
 =?iso-8859-1?Q?Mee1pmujqAMnuq8GFvt4/MzLqKdwLuOxeF1j+jRfH4Hjmt884JLXUy5qj6?=
 =?iso-8859-1?Q?iLOt3tT5wSTOYfi2g6aj269o4y7CJqMvyCkF0DYqEo94Pn8KlPnb/wlsG8?=
 =?iso-8859-1?Q?FkJ+atO9ov3Hi1Qt7L0N4yOz5t4iAYQjpHOHCKJcvZjUkYOq0244EMpm8L?=
 =?iso-8859-1?Q?pGhxOJybCt1zUeKw1Nib/chpBhatMJL74oDkzy4B7ljR4p/6HADbdUL6Re?=
 =?iso-8859-1?Q?t+bdtWG60s1SlNP1XW3jEf8NjBLbSwQP770PZb6hJKd0PYspBQREs9Gai+?=
 =?iso-8859-1?Q?cAMayCiVvN/+MtKAkVIFo/8A0adfKxoS4zfeHJph5KZu8E4Akh024i0xH6?=
 =?iso-8859-1?Q?FQh3eCKDWzKVUvS8HVUlCUHH91NEWBut/uAGs8XvoRfhDB93blmmbyXd05?=
 =?iso-8859-1?Q?vHY9ILeHgZdHXrFPPbYNI4jn2bNr87YTKUjlN1II2HTswBrEKKrBmBMic1?=
 =?iso-8859-1?Q?s8LtFsXplrX9c3UQOdEcYEsn2jJF8PGEf4zDQLM1Y4qCGKGL/rWGn6ME8m?=
 =?iso-8859-1?Q?ri2hY3tfAuG6B1yw9ATCuEbkf18EReRMsdoesCmk0Zl6dFNwYopmLCNk3Z?=
 =?iso-8859-1?Q?dtqG7y+/e2+3h/xSu0Qpymucmzzi5VduxtzYuy/dIUMtZ/jt0McompF+zK?=
 =?iso-8859-1?Q?5AtKY/PHObTtvZ8UVvKdycPDqw2Rq+ICyIs11gSgY/VsVye1Lml24TjK+4?=
 =?iso-8859-1?Q?Os/EFeMkvU46m7jsTQB9qJqFmov6r3gccoM4+TDAEIofN8pZH4Bl/El60q?=
 =?iso-8859-1?Q?UAU3r6RatWMDOYznWJhWEOrd07Qz2Ea7IkOAp3M7TJg4n+Jnb60dZ1CLnv?=
 =?iso-8859-1?Q?jCxdIegZl5HR3hZskm5RrwAJnAtd4Y8pwCyu3nm9M5CpOROqr04SAoQsVk?=
 =?iso-8859-1?Q?k1W49brQyebRi3RgTCWltrk9vx+9PP7IsEpjX9TFpGt6/B5glFAbOOP/Ac?=
 =?iso-8859-1?Q?fJXvhnDy8tdk7e0Rlam+jQHbj/xeaLXqokglN1cMw3IAbwwV081yLIoJ/Y?=
 =?iso-8859-1?Q?sQb65O38Wl7VXICaSYZmFe/YS8AGuBrDJ5NLRsn+hCxOHcaIN4TxVL+W6v?=
 =?iso-8859-1?Q?E1+XH+BBkcfCIveUOsY3WIBzbyZtZX/VP0kbBWXQn0MOIVLcanqc838g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vRqugJYQtInvcwMESm99/uBQ4hI2hsnMLspDMslT/B047neE5WhRfRXiReReo30FGPNGJb0Oa+xiIDNA9dUZYQR025hkQeacKhZdGOuNbhUYNLs+fXvh4sIKhXzcxNtYt+Puklfqq1doJ9F7oBmdSttMqtkZHCfYRWP+0KqQ3RaXkKS0Bka6fr3Ytc0GfxONdT41Y7Iqbc7gVTcHp62YVRiq98zRjm5L2jXpFw42kbBC+kWy/BN6i+p8SVRfF+wVbmOdeqzd0whuBwEXSAiS4EDObQyHLUYXsLG9lDqfNgMEhpLRF4pr9M75pVF+YgQ9otnrAd3g+iVR9vKXtpinvzfhTFelp6XXbR/naKkd3Z7eEtaBOzSkSkaNYJh4+ck1Altif4CALgkS2lMEVwpWUKtNQJmYUGlPIJTWchNcyA1SUrNFRsmUQWwZ/SkMD2xqEpR7dj0XwCxxRGNirhPmyIweAl/gnow8mll54/QL8qhfhf0WI9K+Zd5YnhUIJpgUigZVirZNrnXJc/pggCQaTu3p0Wk2HCT8Tl5TZmgWqq9c1SeSPxuYhLDjxzWUiJPLAvB8tyBEyXXi+d69aaODJbO6M21nxAuRd4VW+8GkWrE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e9ee5c-c5b0-4e24-4ce2-08dd665d7943
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 20:43:01.0563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4kz42HpsUEMjhrVo+GmFYwaMfHqNipa8nDCb1ZbkqtwY+PoaNF37WYtozXOz2fwBDtIgqvcHdMXrG7XJOP+ojeZryGCrgYMV4uYMyhTbdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7396
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_09,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503180150
X-Proofpoint-GUID: tQxAiGCUuUZeUy--Lctuh8uRuITDA5W8
X-Proofpoint-ORIG-GUID: tQxAiGCUuUZeUy--Lctuh8uRuITDA5W8

On Tue, Mar 18, 2025 at 04:35:08PM -0400, Eugene Loh wrote:
> On 3/18/25 15:18, Kris Van Hees wrote:
> 
> > On Sat, Feb 08, 2025 at 02:06:22PM -0500, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > Orabug: 28763074
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> > 
> > ... and incidentally, should we add defines with ORCL instead of SUNW
> >      (but keep SUNW variants for backwards compatibility)?  Or some other
> >      forms that do not include SUNW.  Things like __DTRACE?
> 
> Separate patch, right?  And, we need to coordinate documentation.

Yes, definitely separate patch.

> > > ---
> > >   COMMANDLINE-OPTIONS                          |  10 +-
> > >   test/unittest/preprocessor/tst.predefined.r  |   1 +
> > >   test/unittest/preprocessor/tst.predefined.sh | 119 +++++++++++++++++++
> > >   3 files changed, 125 insertions(+), 5 deletions(-)
> > >   create mode 100644 test/unittest/preprocessor/tst.predefined.r
> > >   create mode 100755 test/unittest/preprocessor/tst.predefined.sh
> > > 
> > > diff --git a/COMMANDLINE-OPTIONS b/COMMANDLINE-OPTIONS
> > > index 40561af91..73be89b1f 100644
> > > --- a/COMMANDLINE-OPTIONS
> > > +++ b/COMMANDLINE-OPTIONS
> > > @@ -321,12 +321,12 @@ definitions are always specified and valid in all modes:
> > >       * __sparcv9 (on SPARC® systems only when 64???bit programs are compiled)
> > >       * __i386 (on x86 systems only when 32???bit programs are compiled)
> > >       * __amd64 (on x86 systems only when 64???bit programs are compiled)
> > > -    * _`uname -s` (for example, __Linux)
> > > +    * __`uname -s` (for example, __Linux)
> > >       * __SUNW_D=1
> > > -    * _SUNW_D_VERSION=0x_MMmmmuuu (where MM is the Major release value
> > > -      in hexadecimal, mmm is the Minor release value in hexadecimal,
> > > -      and uuu is the Micro release value in hexadecimal; see Chapter
> > > -      41, Versioning for more information about DTrace versioning)
> > > +    * _SUNW_D_VERSION=(MM << 24 | mmm << 12 | uuu), where
> > > +      MM is the Major release value
> > > +      mmm is the Minor release value
> > > +      uuu is the Micro release value
> > >   -Z
> > >   Permit probe descriptions that match zero probes. If the -Z option is
> > > diff --git a/test/unittest/preprocessor/tst.predefined.r b/test/unittest/preprocessor/tst.predefined.r
> > > new file mode 100644
> > > index 000000000..2e9ba477f
> > > --- /dev/null
> > > +++ b/test/unittest/preprocessor/tst.predefined.r
> > > @@ -0,0 +1 @@
> > > +success
> > > diff --git a/test/unittest/preprocessor/tst.predefined.sh b/test/unittest/preprocessor/tst.predefined.sh
> > > new file mode 100755
> > > index 000000000..79caf17ac
> > > --- /dev/null
> > > +++ b/test/unittest/preprocessor/tst.predefined.sh
> > > @@ -0,0 +1,119 @@
> > > +#!/bin/bash
> > > +#
> > > +# Oracle Linux DTrace.
> > > +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > > +# http://oss.oracle.com/licenses/upl.
> > > +#
> > > +# Confirm preprocessor pre-definitions.
> > > +
> > > +dtrace=$1
> > > +
> > > +DIRNAME=$tmpdir/predefined.$$.$RANDOM
> > > +mkdir -p $DIRNAME
> > > +cd $DIRNAME
> > > +
> > > +# Arg 1 is macro that we check is defined.
> > > +
> > > +function check_defined() {
> > > +	# Add to script: #ifdef is okay, else is ERROR.
> > > +	echo '#ifdef' $1                         >> D.d
> > > +	echo 'printf("'$1' okay\n");'            >> D.d
> > > +	echo '#else'                             >> D.d
> > > +	echo 'printf("ERROR!  missing '$1'\n");' >> D.d
> > > +	echo '#endif'                            >> D.d
> > > +
> > > +	# Add to check file: expect "okay" message.
> > > +	echo $1 okay                             >> chk.txt
> > > +}
> > > +
> > > +# Arg 1 is macro whose value we check to be arg 2.
> > > +
> > > +function check_value() {
> > > +	# Add to script: print value.
> > > +	echo 'printf("'$1'=%x\n", '$1');'        >> D.d
> > > +
> > > +	# Add to check file: expected value.
> > > +	echo $1=$2                               >> chk.txt
> > > +}
> > > +
> > > +# Arg 1 is macro that we check is not defined.
> > > +
> > > +function check_undef() {
> > > +	# Add to script: #ifdef is ERROR, else is okay.
> > > +	echo '#ifdef' $1                         >> D.d
> > > +	echo 'printf("ERROR!  found '$1'\n");'   >> D.d
> > > +	echo '#else'                             >> D.d
> > > +	echo 'printf("missing '$1' is okay\n");' >> D.d
> > > +	echo '#endif'                            >> D.d
> > > +
> > > +	# Add to check file: expect "okay" message.
> > > +	echo missing $1 is okay                  >> chk.txt
> > > +}
> > > +
> > > +# Construct version string (major, minor, micro).
> > > +
> > > +read MM mmm uuu <<< `dtrace -vV | awk '/^This is DTrace / { gsub("\\\.", " "); print $(NF-2), $(NF-1), $NF }'`
> > > +vers=`printf "%x" $(($MM << 24 | $mmm << 12 | $uuu))`
> > > +
> > > +# Start setting up the D script.
> > > +
> > > +echo 'BEGIN {' > D.d
> > > +
> > > +# Check for the preprocessor definitions of COMMANDLINE-OPTIONS.
> > > +
> > > +check_defined __linux
> > > +check_defined __unix
> > > +check_defined __SVR4
> > > +if [ `uname -m` == x86_64 ]; then
> > > +check_defined __amd64
> > > +else
> > > +check_undef   __amd64
> > > +fi
> > > +check_defined __`uname -s`
> > > +check_value   __SUNW_D 1
> > > +check_value   __SUNW_D_VERSION $vers
> > > +
> > > +# Confirm other preprocessor definitions.
> > > +
> > > +check_defined __SUNW_D_64
> > > +
> > > +# Confirm that __GNUC__ is not present.
> > > +
> > > +check_undef __GNUC__
> > > +
> > > +# Finish setting up the D script.
> > > +
> > > +echo 'exit(0); }' >> D.d
> > > +echo              >> chk.txt
> > > +
> > > +# Run the D script.
> > > +
> > > +$dtrace $dt_flags -qCs D.d -o out.txt
> > > +if [ $? -ne 0 ]; then
> > > +	echo ERROR: DTrace failed
> > > +	echo "==== D.d"
> > > +	cat        D.d
> > > +	echo "==== out.txt"
> > > +	cat        out.txt
> > > +	exit 1
> > > +fi
> > > +
> > > +# Check.
> > > +
> > > +if ! diff -q chk.txt out.txt; then
> > > +	echo ERROR output disagrees
> > > +	echo === expect ===
> > > +	cat chk.txt
> > > +	echo === actual ===
> > > +	cat out.txt
> > > +	echo === diff ===
> > > +	diff chk.txt out.txt
> > > +	exit 1
> > > +fi
> > > +
> > > +# Indicate success.
> > > +
> > > +echo success
> > > +
> > > +exit 0
> > > -- 
> > > 2.43.5
> > > 
