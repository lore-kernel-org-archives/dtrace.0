Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C2A19343B
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728658835; cv=fail; b=GiEJ5QUve3md9XajV05HcMXgTZp7BZfsChmGE/UbXrkyzYbja2bgO38y9I0sJ7ecuetPY1b+yhLFfba12VEdCYK4k/bjUrUHEnYbFtTTxdISkez8u/Ot6weTh245U7dIbrUIx249LX056+yrflbTUiJr4GtHQ3uOYxOxMulLp+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728658835; c=relaxed/simple;
	bh=KNZdl13+fqeoyCNRNOzI5aRRbfme3xC5M88NEE1nmxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kJFW75jpL4e2uCrYdzu5BgZZzPulCpzvb4PISyntVKGXwRfxld2sx+vjOzH7na5kXmbmcz2KjNjxDK70megYDO4oUv7PRXllheUgLgawC8j39RBpSPhfc9e/+DogTvGKbQ1ZrP4ANXYK+utlv2eBqH+n0/GRi+8b9FCLCQNrmzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H/bqnZE6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eyBGfFTU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H/bqnZE6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eyBGfFTU"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BCpVoB019465
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 15:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=f1O5aFTZeExFg6vH7Q
	hcg75zl1hTJ1MRADX/pu4iTVI=; b=H/bqnZE6TU2whfXcRjusdClqslRYXBlRBq
	l+NQHCZboVkHBm8xOzm2B7fg9zSABVkMNNudRvvJbjT7Uv18GYSIhVvqeVfRMlA9
	eLJen5FQCNqWfvwC1tmITugngvK2a5DPdEQ0EHe4DlH+dbwPkMQau/R8y/EU5Aed
	jcsRJ7eMiKNhOfEZAreQrRKvJiDHvFkmUsA+ivXMLpry8zPfZ9On21hM2SRASZVn
	RZWn8nrBKJUcbAy28rthKZkry4VzlaSKCNqlIEr+5gIKhu5kbKK/tK+iItJdy/A1
	YJezEVcWUXCvClNp+brKRON9H/z1His8TBNLpufTRZHbIPFLD68g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 422yyvd351-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 15:00:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49BE1E42033421
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 15:00:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uwbcrx8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 15:00:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHDthQjOSKLN6q/RX+U/hehH6+aJGKRqKhXtClk2XLTKz5ZlsDggIsjEnuG/tJBNScpTPFTNp3jdQyJ7/If87LFyoD8K3om6AtSpY+kLFO6vSZerZ812MgXFbuoMsg16931AT7JxicW59VYXJYT4TxDwZLsmW/gb+oTctBr+CXf2UHFf/d4pehmEVagE7akVjwuLq+ycEXgcqqZQJNVOtq14oXHKFuOQZd5fEAtKU0yufTxeX/onigJxbtmjoMXS6WDreaW0RcXPG0BdmAPJYajdnP0t72GhAL4UzfMEnWvEdhhGNKf6LljJwz2gkbteRZdjRg/cOss8BOOOfdy+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1O5aFTZeExFg6vH7Qhcg75zl1hTJ1MRADX/pu4iTVI=;
 b=lUheeRBP41o4yamF5BOBYwbqCQ2KZiM71V4zd0myY1XFQUzfQeBmo1MGyVui6qqPvts7ub0hmdEDje48aKqVrt/qYw57tf+3Kqmhwsuyt/MW46B2dBa9UerDtn6IF+vqAjn6NMioHEaIYsg28jTuk6I/qR5YtTnOQQUZCunMaeBMAJjpGYpcXe9wn+Fl7BE/zREj7p018QxtVSTsBLPbMoGmtlKXXBSB0a50TbEWaGRNuCXu7pmd1apqsUazs0/ybxXDfN8Bm2d6Tqt+60xBt9aDvgib3iM8XPRNZobSxSBks3Ewz9MI539QwTpj7e9pXOjMGecVjRKfMzItiUFTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1O5aFTZeExFg6vH7Qhcg75zl1hTJ1MRADX/pu4iTVI=;
 b=eyBGfFTUCgfVJ43/n3mU8n+xCki7oUZBamtkoP2Dzc+sv1IDu7RzpMAv0n6sfXiz4/PB9hcz/E2V1dCGSduJBEfEpeN/w90i8ZbUVRt8QKkxbrpuu6HLA/f3Nqq3DcqhZ4qFwqZYtTypLt1yhQh6xFJXu59U6R1DrCJxq0/0fZs=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH7PR10MB7840.namprd10.prod.outlook.com (2603:10b6:510:2fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 15:00:27 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 15:00:27 +0000
Date: Fri, 11 Oct 2024 11:00:23 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 dtrace 1/3] fbt: support "."-suffixed functions for
 kprobes
Message-ID: <Zwk9hzo9WEqrcKdp@kvh-deb-bpf.us.oracle.com>
References: <20241011102810.989562-1-alan.maguire@oracle.com>
 <20241011102810.989562-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011102810.989562-2-alan.maguire@oracle.com>
X-ClientProxiedBy: BN8PR12CA0026.namprd12.prod.outlook.com
 (2603:10b6:408:60::39) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH7PR10MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: c61f35a7-a786-4c3c-0132-08dcea0570d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?byBazlfAiMLQ3UtP0RlwRlNIDZDVCDqa3N2WWFn3xno9K7XZrvmJBpreW3cX?=
 =?us-ascii?Q?fRQgg5OwLffndjz0LVWoBoOvH/qHNRd/+wnBMoN6otG/d6orjjNVtggYNgup?=
 =?us-ascii?Q?mxSBw0HNOEifO9VHdH6q/JQdzPFq6ZjIEzNJYQV2wdSQGNtTM3rhs4rCiUuK?=
 =?us-ascii?Q?oXBa51JP+oaEwCqHggTU34ktu+Sx8lYrhD/BIJsI94/yYjFKnmGivsFN/nzI?=
 =?us-ascii?Q?Yap17fhwfrdPUEV2cTZWqqxbKddbc6OxjxrpB7c3dG+sfX3wbc8utU+DOpJ3?=
 =?us-ascii?Q?OElXrtctUHBhoxcCCYDJqq6OcnZh5TxIP98odTOpmjphcxZy4kVGCSa90/2V?=
 =?us-ascii?Q?G40afoPiPF0u9mtTK/P9pQo63K20vlp7ceRBUyjsK5r291Awrhf1ML0NlN3y?=
 =?us-ascii?Q?yQ9gzrjoD93QdXw8GGuQfoFoEeiJhIs2mOp9/ERLXTyCXFDbu58kIDUvaszL?=
 =?us-ascii?Q?2A4xUQsK+fktfFGU1ksz6K5TmzzTKOnOwVHJh5+b24ORoW6ZbAVRTbYjsgYT?=
 =?us-ascii?Q?iX5AkQ+xd369p5qDnEh4nYSQE/KL7NYtY96M62JmOPk+npLLYeeXawjYpdXN?=
 =?us-ascii?Q?puBcyczHcatq2mWONmTNILmuAO/b67JOt76PK6ACbWdxc+t1BlHZx9PHejXM?=
 =?us-ascii?Q?j2eaYp7upMprOiiryvyEs5j17lJnxR/C7updjFA2pXXmpPk2ej78bFlpQxB+?=
 =?us-ascii?Q?i1N/9SFWVtZ+Z62vv3h64NdYNJnlJu8XGSF0ESHw2qnfz37yiQ5gR5Q9ZeDG?=
 =?us-ascii?Q?Ca2V5O09oLAac28LmEhQ8ECtHYUkEmMRU5FoemjwBbltSxCpLOMUfOn/xAYa?=
 =?us-ascii?Q?/WYrOrHuT+Bdk72fCyJY7B7qBrwNidM9ZQnYOLTxhnAWWZBRGf0KXUz8uHU7?=
 =?us-ascii?Q?PFv4cvqx4rAYuieP+LN6jHBzX+OPOcsB9sejUWsrx6rFkdqaf8msP/Fdt2NJ?=
 =?us-ascii?Q?MKlQILiSi3de7xbojMnJNvAg829qScrREfhdFhIC9qobwwgnOhOe+hyzYM3n?=
 =?us-ascii?Q?DEK1KwAyio0PK9u56pOSMvnxzYy3ucnz1fzBLW2RpWpP4VeaB4LTVDWhYz//?=
 =?us-ascii?Q?Q7myx4ZxKGtNT192iGQpF+Uxo1cg9ACQvslJHbucUFWgcRja6SLaV5iqgKdS?=
 =?us-ascii?Q?Pwyc4ihaZVLtg5CyxQTDBNVC2r/onLKMXNC0iyCwOdzRUnAFT0i7JANFtH5n?=
 =?us-ascii?Q?qDmcxEtEJwWPlQCPPN1PsoXVnEf20RTBwa60CraaAGbGqHG4Ab03CLZ5FHRZ?=
 =?us-ascii?Q?P4LkL44ffvYBf7+sQsiGZBiv4gbeuHDh2dLjPtYevA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tq58lMwUdftZDhSA8Z4esy/HqFrpl3rgXrdUjlWR3QMBu7SN+LjxNEt8dZCi?=
 =?us-ascii?Q?jQuUtrkrKfCZCHCfVueIwA0ZwIMzWRrHsI1EuLQEYcioQt6FxtyDAWAvOSAm?=
 =?us-ascii?Q?zx7I6VYypszpn+PSLMYXEMcMGMMyLT/UTv4/qs4xnuXDdCSqzALoQ5A8nMeO?=
 =?us-ascii?Q?NGw1xyKyKJZ+pVjtfbxqQNzzO6WSHtwlrPZ/h2xMQWGCHK52wtrKaAWYb2MG?=
 =?us-ascii?Q?6Wv9Y9dU1RLPFu9rN1SHpjAI48Ny7glU7uxy8SjtZuskQ8ppQI2Yss4xzySZ?=
 =?us-ascii?Q?2TttrRMoEheKrawf/Q5HZc/WKj2Pv0VIIfE3wfvmcUjPHFDyiHS5GWSFDyb0?=
 =?us-ascii?Q?faJu9ETDrRi8l5XAX2WC/L/O6lzwUqdkxKkVJ6H9I9ave06/NDIQufjnSeu8?=
 =?us-ascii?Q?55pJppobyt6Znim8GIMEd5QKKGwUCDonaPVzT2wnGbsZIOmzDvJ0tamgUbIJ?=
 =?us-ascii?Q?GXoao5bpTUyTstjWrFkdPLXpMsH/zErkgzjldYA8aWQWJYJ4nU7w6AGR5ln/?=
 =?us-ascii?Q?/p0hEJOpCzTXlhrI09hoYc5KUJIsuuWMPRY+6n5efS///xA4e6Bqy8xwMv8y?=
 =?us-ascii?Q?56a0rx7h1wZj8aIsHOYHix2nr3PfE4K6fbpklKnl8h940z2BVo2XKXoxyjMD?=
 =?us-ascii?Q?TZUVl+iBEGmhC4Pz0B52ZYEqQ2hNt+nkqYN42/iQBLqLGswZO1/BO4ZZqbcv?=
 =?us-ascii?Q?+3eIzdh73NFRBYVYhFT9kt+niSVrjzHMP6ruCRSTfg/SwkMpjy5YuRq9RB93?=
 =?us-ascii?Q?oF6P0pxiWdGs42VqikM7MYpRS3mTqlDZ1O8+l19OskXN/7YKBq6k+w0hOORA?=
 =?us-ascii?Q?vMa7nGDBNw/IIsRxoAG+QW5ibQkLXsG2PlF9ddABwHSFuNleGWgxLDznNCHS?=
 =?us-ascii?Q?DsVqLMSaHA6Nhjpk/6FUBpK9rq4Dv9Cdbs5hZS5RSf8kCVB5gALekW3Cqsec?=
 =?us-ascii?Q?7PQzJ7U9pIiXcYcg9hjQtUfPo8t5RnVjZ96S0/C46zkI17bQp3FqAesCwXj/?=
 =?us-ascii?Q?fF0yHfdo+5NzBVrYg8Ql90xVGFgNzi1IzsYdkgEZJ5tCKk1GEX6zKWfC/NBR?=
 =?us-ascii?Q?/BnjI7vgveB0/MdhCMHexDrDVnokaKNnnDDpp+zI5OS3TyASkxVM2lRWKoFd?=
 =?us-ascii?Q?dOmASVJX4DDAFmNamQ1aKShXpsSgjo0l5RhVNVA1N57LMRbc7bQ7qFlT2NL8?=
 =?us-ascii?Q?GPCX3YZ3j2ugReTpjhd4IEy92DMimCb841bKHuFTc45AGNg4PQylzl1oFblF?=
 =?us-ascii?Q?1crx/sPcfYalHFu3QR5M8vSPHc8gB4xtCQO8OzoxvBYVgyuR9OkUaNpX1zpx?=
 =?us-ascii?Q?5lGV7oJW45/+y3PbdYKl9MkX1fqd0Biupi72fhxU92tZrT/glwivsxqkEEzH?=
 =?us-ascii?Q?Jn8IpCWFGnfPNhByLub6h06qp2vovN31q5LrRDw4+Rpm7Jf7eu1BkT8EIEBT?=
 =?us-ascii?Q?QIjzBmA4aDjgBBHAOA+ZpV5eVCOisCntVawg+Gj9HTOC3xngY3fC/r43fr2q?=
 =?us-ascii?Q?KemqVK2TnUvVonkcK9mZyUbczL+h0eVA+PBmK7140f9AsJN67Gblhg87AaPs?=
 =?us-ascii?Q?qdYhA/x5gj7adpv2nElj/u58Xfoz0/IUZwxWcRmfYkr/xOrY8rv/o+zCbfT8?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3yMSGX+D93CXcgHOEodG5WNVDhkOAV8L/l/PtPJXhcunvzMQnN1o0CL3PcA3QE51hPT6vwr8KlhroiqYglitZ/Y9MCsT84iy+Sq9/+BI0yjFMS1oNejXvWMW9QJhk3ux5qpY3NPGVulzv5pnze+SEXxOggSI5m2F2Fo6syFrGwh/gmvxZJHN5z7ztJCuk/kdQRSx/8Kzcfn8eUOl1TagjqDlxNfjjd8fW65c4nlzxYk0/99ulVVW86AUaHgNnP2g6lLaz0Jak4wGXyq295nurd0cdgG7NnLIZv7/npZ9Is6q6WorEwWjlYLaEbrSxzBrs8pJCelcHJMefn3dKpGT2Kb1DC9uuqdcIJPpkJlmVJOMrztMvDutdcFGYlQP7jIah2TRIsrYnaIhKdBKHkioMgflBrQueHcsMvQNlhdJ+B+8I1vPbV5Fh+ZaASFj14DR9xgtdUA8Nrmu0n5E3CuAf5Deu4nDFIzXpZfFnBY4Jv+kHOH1ENw8zhvRvlZTwz/huJ3Z/NnQDLEKVb7IrkiSbUfUs8y+FEz9EFrmoTS34jXzxeuyGej1MF4DUDrPwohOV/Y3+kBk6md3OziglAdUehpXXp/Ssy7iEheqgxuMDfA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61f35a7-a786-4c3c-0132-08dcea0570d1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 15:00:26.9083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNzrCOzOD49dBtpCEP80Zv66BOSOrRacwAwur5uMWa4/C6OHjw21porRQVFsdbwzRX0G4gIPuvM4gHODXCN6tGjAaHhhYuZ7/reOW0mM3SI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7840
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_13,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410110103
X-Proofpoint-GUID: gBjg52Rt8zkIh5OtY43gppQ58J0sMyIY
X-Proofpoint-ORIG-GUID: gBjg52Rt8zkIh5OtY43gppQ58J0sMyIY

On Fri, Oct 11, 2024 at 11:28:08AM +0100, Alan Maguire wrote:
> gcc adds suffixes when it carries out optimizations, but often
> these leave parameters to functions intact.  Many of these functions
> (like finish_task_switch()) are important for tracing (and they
> are present in available_filter_functions so are traceable) so it is
> valuable to support probing them.  For kprobes, all that is needed
> is to ensure that the event name does not contain a ".".

The challenge here is that not everything that is present in
available_filter_functions is actually traceable.  I.e. anything with a
compiler-optimization-generated name (*.*) cannot be traced with fprobes.
Also, at least with older kernels, my testing has shown that not all that
is listed in that file can even be traced with kprobes (probably due to a
kernel bug that has since been fixed).

This leaves us with an interesting challenge.  Since we prefer fprobes
because they are faster (and give us argument type info), using the content
of that file indiscriminately is not a good idea because it will cause us
to list probes that cannot be used.  On the other hand, if probes with "."
in their names *can* be probed using kprobe, then it would certainly be
beneficial to make use of that.

Now, since the .-names are compiler generated we do not necessarily need to
list those as probes.  We could just list the base function *if* we can
determine (for FBT) which suffixes refer to variants that actually constitute
a valid alternative (where function entry and return are valid representations
of the original function).

> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_prov_fbt.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 21f63ddf..0ba0fb71 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -106,10 +106,6 @@ static int populate(dtrace_hdl_t *dtp)
>  				p++;
>  		}
>  
> -		/* Weed out synthetic symbol names (that are invalid). */
> -		if (strchr(buf, '.') != NULL)
> -			continue;
> -
>  #define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
>  		/* Weed out __ftrace_invalid_address___* entries. */
>  		if (strstarts(buf, "__ftrace_invalid_address__") ||
> @@ -363,7 +359,7 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  {
>  	if (!dt_tp_probe_has_info(prp)) {
> -		char	*fn;
> +		char	*fn, *event, *s;
>  		FILE	*f;
>  		size_t	len;
>  		int	fd, rc = -1;
> @@ -376,22 +372,37 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  		if (fd == -1)
>  			return -ENOENT;
>  
> +		if (asprintf(&event, "%s", prp->desc->fun) < 0)
> +			return -ENOMEM;
> +		/* replace possible "." in event name as "." is not supported
> +		 * in trace event names, and function could be named foo.isra.0
> +		 */
> +		for (s = strchr(event, '.'); s != NULL && *s != '\0'; s++) {
> +			if (*s == '.')
> +				*s = '_';
> +		}
> +
>  		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
>  			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
> -			     FBT_GROUP_DATA, prp->desc->fun, prp->desc->fun);
> +			     FBT_GROUP_DATA, event, prp->desc->fun);
>  		close(fd);
> -		if (rc == -1)
> +		if (rc == -1) {
> +			free(event);
>  			return -ENOENT;
> +		}
>  
>  		/* create format file name */
>  		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
> -			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
> +			       EVENTSFS, FBT_GROUP_DATA, event) + 1;
>  		fn = dt_alloc(dtp, len);
> -		if (fn == NULL)
> +		if (fn == NULL) {
> +			free(event);
>  			return -ENOENT;
> +		}
>  
>  		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> -			 FBT_GROUP_DATA, prp->desc->fun);
> +			 FBT_GROUP_DATA, event);
> +		free(event);
>  
>  		/* open format file */
>  		f = fopen(fn, "r");
> -- 
> 2.43.5
> 
