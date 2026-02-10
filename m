Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B532E26ED3E
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756320; cv=fail; b=sAR5Q9yN55D8jnb4ikYxWK3rf7Zo57P2GsMgrz5OWKfYsylpxuAxZpBZfFwbgZw1KUFQBtWnnpWgQMmSJTM548ESJxn4jARkwZ6WLuPl3BgAvc4Ow7kerlIZ1KdTfZNHX8KA0oqMCdZT5mixrvux6m0T48JLbOZb31BJ7z+2TcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756320; c=relaxed/simple;
	bh=O5H+3Qeubhg6ZNetmvPHa/yRz82YT6yncYkuY6zA+S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PATz9a6tml82Kk7kZ5woaA9MgyM9DCi6EWcnMHPkU6RcKUdCEr9k/xsGcgsR0OXAUrIOuj22wKT8CumAFA1jlBpvp5+9r7B6LzBBLgEkZCgtocau/e918c5O7j+AV8u/HSOyh4h2gE2gEcC/XEJ0fwMFNQjkhvY2TcQLMWOw104=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j4Df6LpW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gUsGHVYc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j4Df6LpW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gUsGHVYc"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AIhab73921983
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=XJPkyk4tzgHNRxSZ80
	LdkjN4KaPKSbe2u4mFFHbnVAg=; b=j4Df6LpWpyLMbAlykaX1rTyPvSPCpYAmoe
	SIn+6m/ZeT+TfcQ1JPNfcnsblf7pRjnROFWChhgvcD+evh1uYz2grgJV/4aCE7J5
	qmOjLx5sO/m4uHIXXxOWu1sf9B/Ao6tiNgaphASF1zVLtc+q9tr2zmNIU+YA6ept
	Ue2Vpw6IPaxSErb98FftwevgRrn3TdXbhTFhuHhY++PbGMregb96TIDhGHpXokVe
	wuEnVRL8UIUagzxF6AevlHfvMJX3HPdTAOTcxmbwIl+sAAZljNarL/M+EPNwDbho
	/ykng3UtC2E8Yy9fJTo8Tuk9lmiuCfofFbIoc9ahcp/Zo1TRcJ7A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c7rxu1u8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:45:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AKUfee007891
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:45:17 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8234ujau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:45:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u80J8r81KywS6WSX7H+Ej6g7ccKMdYZYWpOirO88P/V374sJUlDEV9RMDXuze02esFwAE676HP00UZeRuo1BczmWGalolWKNkhtowt0ozemwHyVWkK2hW8gQctk7opjWi1i9hodnPTH/toJOjdmefEns3kpjH8xlVaDFBJKq1vvm8HOniLi4UK/97gi4tvA/4FVpgjzR9kWCgOm5EqFf30oUMWRuBqpVZvij1yP+H1LLtFw12/1XAzxhVc/jcCs5ab64XZko1cIuMcj5X6dTY1QkKVH1pk05Q0rjX+Qo4zAQYzS9gpxhWafGESeBcZ3KzNQ5b1aEtUEIOfi4wdJa1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJPkyk4tzgHNRxSZ80LdkjN4KaPKSbe2u4mFFHbnVAg=;
 b=w2WXLOHwdQ5I3G7iPVW/i99omPr51E2lRwvOGqpLVuTmwVoF0XxmG9KlBWKTUlIRq68L6DAnBJejZfZrAkUBlDSDEgyAQOIxi+OsADqFqR3fK+TO1tckQ3Srmtqkd7C0uE566DO86p7HDSCUlpgImEtqxrjZd8n0KdhQeHpf1BCCsSVRBopG7CTz+CGQFqE1rK2bbVWILJIAGjeeaYIRVI5J9fynpABGZ9k3BpjFB7seKQrddg/ae8gfT4o+flT0DwNM3e4ZYPhYiuL4mkQ3fnnU0TzNh0cRD3JO6202ZiQDk9QUojS0OkssrwB7AHIID7ju/F73I1jemjGyXwmeVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJPkyk4tzgHNRxSZ80LdkjN4KaPKSbe2u4mFFHbnVAg=;
 b=gUsGHVYcRmySzRE64P0EX2r1XvzkTiEkUZbZ/m5Spuc/cDLw+hITTnlVtxYOq18xF99dOET84k9AqcJYd8HdY07bLWEu9Y6TROvyIJvJul15wu34JH2nFH6JdEKI803vksheTcLIxem7e2vZ1SOYhi78Om0JD4c/dNSp2WC6nMo=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH0PR10MB5097.namprd10.prod.outlook.com (2603:10b6:610:c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 20:45:15 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 20:45:15 +0000
Date: Tue, 10 Feb 2026 15:45:12 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/3] Fix init_disassemble_info typo
Message-ID: <aYuY2GS1K9PhYi4V@oracle.com>
References: <20260210201637.8863-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210201637.8863-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH0PR10MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4160d4-4626-4c52-579f-08de68e54b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZocNevpWOzO8r32G3pG3oNUSf201s600svjkAkEdhZIMbKwaL7pP7/thSrfj?=
 =?us-ascii?Q?HxxhF9z6oGAasfzOkN+niOP0kIyr0p9NA31oqi8NUMA2PygPwBi5bU6Km4rk?=
 =?us-ascii?Q?EKXBOFxMaRU9/G/cNHo3Cl6mLKnSll7Rj4lYFl4my9ZJPsL/agX4pMutsnms?=
 =?us-ascii?Q?nm7HzY9q1lAPNB0jAWSDkb3h1IWZsCQkXqI2zVQBIQoOcj9LABha0vhxW2ih?=
 =?us-ascii?Q?OC/kwKVgydQ7FAtnuxlQjW8HbzEWBQCW1MHmSxQvMTX0LhbIHWmGRmD7V3Ls?=
 =?us-ascii?Q?yJNv+Pj0lUNeE3vbTrLiNAaWhP8YLzVD770JOthH7F4s5T/B6oq7EARZcEdt?=
 =?us-ascii?Q?xBvZNWMensuh4ZhHggP+Pad6HlFSRdYUkvOpAptFE/EFCmzp7nQsSnGnrTBk?=
 =?us-ascii?Q?JpV0q7EAbExMQhGyq6h9/19KPamfSrjfY8qYR/bABz9un6CMeua7VGUtU9jK?=
 =?us-ascii?Q?+jHwIQlWpII+qRUkiU7g9YcelBYBDw/VPVTiDoESx47TYle8Kyo1UG+sBxPQ?=
 =?us-ascii?Q?lcQwEKOeBQ0Qroo3stp2E1sz9qeli+mmBYjf1y3niNIt2l7iYjV+tW+pWIJB?=
 =?us-ascii?Q?DRgF6aD/Bchcg07PQS+TvWo4x/zH4VbUPWcIrDR6jHCbP1S0rw2p0v7oTwoz?=
 =?us-ascii?Q?Am1W+5GN08i+r3A/o3FtVM0alGMMa7Dz5vkN+fOZ4sSM/yZMvwA/FMpnt5Il?=
 =?us-ascii?Q?qo9uyv1VCNR53zk8Selc+RD5ngw07gu0KJ5cG3vOYbaLhAR6/lH6tn2/jee6?=
 =?us-ascii?Q?3pM5p0lSMi2rncT/JFgG39KInGqhJWue5KTLmcxSraYLOW9noDN4j79ibz0W?=
 =?us-ascii?Q?6cYb0ghBFDKzRssnaVnJz6REY0ATOjDZ3rsW0aQEiKRHEYriW06H+fkZ4auC?=
 =?us-ascii?Q?wW0bdqtiKsBRlh30zvpNx0blOM/moyL/I3zwKUWKMid3sMHU0mUSMTIHB6hG?=
 =?us-ascii?Q?6ND2nxR641wU6g74LSWmOvmhY4Z6DCTw3XLZILTRS8ER/1Flrm1cn82wN1Lg?=
 =?us-ascii?Q?KxzMyEqVmaY5dXgnbF+kIP1KnNMXyeUItunLlsvmqh0+xOF+oa7enjOH6CBN?=
 =?us-ascii?Q?fEpaoN26HxsaVWma2qhnUtKt+S/cazotY1ekrOqxk8nMd0HQVA6SMKnAOvbP?=
 =?us-ascii?Q?m475OqpdTOA7AzFUfgyE23Rj+0v5rl8BI+i3fkkjWC5yhPiWVWKFwe5qFdKl?=
 =?us-ascii?Q?MXj148qGVhrxhr4zJ0O/mPbUej0EIgM6t+v30Lmw5rCn0nRPWWZilTARsy3b?=
 =?us-ascii?Q?Mfj4dG/qq561jtHNgKpGOwBfR1XvVWOXLl0unPiWb9GT0Le8vRNbFQEvVDZb?=
 =?us-ascii?Q?jaId7i+ufSYwkadY3h6x4DToDyYoYf2VsOu5Yrg9l4ZA55MG6hkg1EKvw06K?=
 =?us-ascii?Q?5SZYM3C7D4Whd3xjrVZjgMy/U0YP2GrGK56NFGirnaOqanVNjb2cidBBF6n1?=
 =?us-ascii?Q?ZSPffJlioay/hEwzsO+0mbGV9YKp9RvboyMpBl/q1WKsc1EdQ7sRHLnhxjGP?=
 =?us-ascii?Q?3RKqxFlQqQfQOw42F4tPGXxgRAm8KorWRyqoCp5AE5mSXT0GRpTDMxNAA3aX?=
 =?us-ascii?Q?pRI75Y1r+dQkhPhm2+w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LuJ5ISA8KMs0mxqI8DcjWTv3caUdHjMUG61ZHgV/CYn6RaHZRVkwlfrmc1Cb?=
 =?us-ascii?Q?Nb3AD4fhAn5PHnyeSp3Ba5NwmdKOhYbxUAv2Utx7UZKBZV39Ye4sxaFxIGLl?=
 =?us-ascii?Q?/BQN6gMnqkjQkOwcGI7pczhf1Kl0wnGN8+FiYnLSlXDiOgHLOKmPwdAOmV2B?=
 =?us-ascii?Q?BaqqB206jf768Z8lpscUvA4KHv67dDNwhQvMABdAePPy4PEw1tR31Echadmh?=
 =?us-ascii?Q?3WlDrlUrPG0jVGPXJzZBipnRxpT4ul7wtWxoTeA6yEoVZ/o5BP1QAP1sKtqp?=
 =?us-ascii?Q?8imwD/ourqQMSFJ/+GqXkxvcphnd9jHTMaWz80cDfwXN18jrXElNEWSt4+7f?=
 =?us-ascii?Q?Tcl0PF52/gsfGSWLRDcmmvC97vyirorTRn0dRH/qPfkH5+yDUgHLXyoklgd2?=
 =?us-ascii?Q?WIXMb6PJPalycbDHNEsUa+5NGDTZmaNbHcybKekjC+LEqYYJElA953CzoNcL?=
 =?us-ascii?Q?i7FapaHgEcWHKLmyVGazipEoe1Lj+G786U3SKCqo8ibYlpBeJQrB8oT3EjFY?=
 =?us-ascii?Q?mhfLjfzeQPTclzxaHt8URkJYJlwQqXG2pf9sCrDfl4pBLhojqvJeDTnT7CYS?=
 =?us-ascii?Q?TOltPoXi5Q1ZshZvG/wYnJH0gXttxVJmQpW4rmooYxpNsU5qD1ftMnLGEQ2M?=
 =?us-ascii?Q?crejFohO6xuF6l3PXXe3RMjuIRV2Iv7Cy8CKlmL59pLNpEEnaeOehBrkqTcj?=
 =?us-ascii?Q?QReNw3Kn24tVIhJXVBMyTPjILzzfKjsQB7UiYwFWcLhdLI4CCkuoYncZyBdx?=
 =?us-ascii?Q?Pdv1rTIBtz+/i/Bo1Ogld58oHnVNz7cDneWoMhM6S1Uq6vd8L5afWRsxcHca?=
 =?us-ascii?Q?t7XwSQjrX36c595coyxo5Atd3Dq8Ba0JB4uDuxWIZmic6XzCRTohIkrw0gqD?=
 =?us-ascii?Q?qYOA6rx5pu+tOi4K3u21cmxXNm2OMZrPY+pnuVhfxiU3sMtRNuMhKLk905y3?=
 =?us-ascii?Q?7Od3YZ5hV80LCc69xX9yVSYduMsJXdBWGYSEB+b/r6YkH9u7ZeABvSj12IdJ?=
 =?us-ascii?Q?lidam5bJE7rb/p1JYZ4vB+AegU7EuXgkAirwLXIszb5TaEzjyYrC45cGW4E9?=
 =?us-ascii?Q?Th5F0Ulp18KsPuuL7/Yak4P0qLpIP3Z8z0PWLQxyX7uQOItAKhQO/RgD8Kn7?=
 =?us-ascii?Q?jqb0BlqUdXeoL1d5dtHUFZMI7XdSEZ83iJLsysIZOZWr94YH58ZEIaSHBJ2j?=
 =?us-ascii?Q?R6aqhuP3poupE5P7WBbZvrqEn2xcWlnyaEiecMdZGOT3OPyIJPQ5guzwMdqW?=
 =?us-ascii?Q?+gfHWHwWAKpcPyGWghAlYu7enUcVqgQ4M8GjLNL/td40a27a5KWsNplAnhlm?=
 =?us-ascii?Q?JH8ihb4hMunkgbGJ63I9rJW+Bk3ms1NaVQxnMYx4/7xYgOPaetnKAv/p7qYm?=
 =?us-ascii?Q?xFGE+rnMh00Cy0vYYJzwfda1txVpruo40mON9449RcE6mojvoR1vLp5J1fLJ?=
 =?us-ascii?Q?zNJftXPLWgU9Pbo6MzCQmoA9z8zZD4TlA1tZSZ11fODmaJxW06b+jXckPel7?=
 =?us-ascii?Q?7+CYMS5rr84Mx2H4cPDDhM5wmCjBl8bf03qgLYxvaMhPmeEUlcEkDPA4kjD1?=
 =?us-ascii?Q?6HEB4lGa6IgHtubkPyK60f4GXv1aJcn+zmvXYSfr6WSmmGOsiaX2JBMokRCH?=
 =?us-ascii?Q?03eQEFJCTcQsLGBRbfBl2VRTNJ4g1N1nIz/2pylRwnHpiPcbwMwNj45+YRLd?=
 =?us-ascii?Q?SFFE5f2oY4rg5mhpOEfiY4Jj7BUex+eeq1wuMqxbhQP2fjwghprHU0kIZJgU?=
 =?us-ascii?Q?y4AJ62Iy6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MojhQC/9IfUVxlNwfbMuDH4PvQpB6aaIptK66ztYKuWsrNU51OKB+WwrBZj8bs7nMLd/iPmov8UBOJOdpFujW624ws5ogg0mM+j0U2kb3lZX+hZVwLI/zBFfA8ujfSj7k6/03uAP4dZpXiPjA1Hu5742tI6ck0+Xjz2zg0kC6H0qequ3i3wsa60m5Y3tY6/pCJD1JCs3pnNNVvq/je3VxEax1EX1YxpQgCIGo8EsS33anyzH09LIZoAQG4YeJRTjJGTKKZp8M6WHpoIHDJVo4BO+21oWvrBY4u8bNjik9UiNyyJKxGuWWkjyTpmqUOLsYcGJDhRustc/P+cM3FkBbf5xecVXA8Pr0lYJ/4HQwoh5DLPYoSZJV6U9u+uLeSZfyUV5xP0680+/HE3kYrsu7tIcxFr0jQ4qe6T0bn5rdstEoceyDiiqFJdZOyjqMKJooILxyrAXBf3g8biOuSv63Z4Tzq2f3ique1nQ5p8F7O9vvM6P+0TvFykjQLKLcxf50zT6Npoly+KRukyi+YFt5yfehUgQ2Sqh6PLO2gJLT0WD6ljSVxiWyn6W280k3Bls0oYF9y7ZAKmEBKISVcvvEFgtUuSkUpvoAo0lm+3zkgk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4160d4-4626-4c52-579f-08de68e54b0a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 20:45:15.1032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysAhUAB6cblw8LQmiRCde1DKChvAfhtrzDEoie2PogGo1M0PElp9QVoDigXw6XUDukJsD4zKAJFc3GWeUUpe+UgwL7yYuUJFUWR2NAc3in4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5097
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602100172
X-Proofpoint-GUID: b7YuJJWBHQ98Fz8Pkt2ZZTIe7GVRUrg8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE3MiBTYWx0ZWRfX8XyawYi5pJMr
 tNIYatVpO5spMlfdhIqZohbgaLieWxSHan8stunNi8pxyhhyh8IIVt9KN7vpRox5z0SgSMBejCH
 pex5n5IGxKLcGZy7h30ee7oifTIDY4bM+6Wi/sZ+xDo6cE5Au8wisU/+lD2/J4uRJik8enV9ItF
 xooJxzzHRtLsJ0OYGVxIU39W9ZwfxLyq7d9dyXDtFRrYOQQbro1E97vMng7DXuajTjowYXSw+ks
 uXH0dXz3KoYBPRf4/HBCXzTuyrNWwudeZscWasHxPhRFrCydzLecNW6APkli3Yn/ZXRZQ1nbyp3
 M2/vGG7dVBzUQsRrkv2Lxp1d5IL3anSx3kLFanc9rJNzfcQIw4M5x3aaxvFxA+K9QJU+3M/0yGq
 971E0+HsZMGEUuNr1NyZSuXbjWkI8R8xd47uzEaEqugKpSKtte9golgIWRl+0BweLyv38G+UhLu
 6Vg5oMwsoPv6BF8zNIQ==
X-Proofpoint-ORIG-GUID: b7YuJJWBHQ98Fz8Pkt2ZZTIe7GVRUrg8
X-Authority-Analysis: v=2.4 cv=Y6f1cxeN c=1 sm=1 tr=0 ts=698b98de cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=RxN4rDLGnYCwryDzmSUA:9 a=CjuIK1q_8ugA:10

On Tue, Feb 10, 2026 at 03:16:35PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_pid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 20458a511..690d1a2a3 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -133,7 +133,7 @@ dt_pid_create_one_probe(struct ps_prochandle *P, dtrace_hdl_t *dtp,
>  
>  #if defined(__amd64)
>  #if defined(HAVE_INITDISINFO3) == defined(HAVE_INITDISINFO4)
> -#error expect init_disassembler_info() to have 3 or else 4 arguments
> +#error expect init_disassemble_info() to have 3 or else 4 arguments
>  #endif
>  #ifdef HAVE_INITDISINFO4
>  static int
> -- 
> 2.47.3
> 
