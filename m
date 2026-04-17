Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC6E27EC7C
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776452674; cv=fail; b=FRI1dtZngNPGqj00hiZ602zgLdaguSmd1iyTKBmpUAz5IwuWWMErmRIJL37z+ozZsdgN0IgP4JZQH52FWN6F+kQdZnB5VSlVIBrLVRftt0DCRFauGXOqEqizlxryce9B7Ow4AIJb74onePujdeZreMBVeCEh4QOchaI+RrbAzcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776452674; c=relaxed/simple;
	bh=anXq73RelED7oRwzIDgS9vekqXW3Nlr88xACRcligIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LyM7uX6dQEN45lJkQGqS50Lcx77Pm7efEzQO0kBBEbWUAAd3Zr5kAa+VJxonueGwlxyNoUGPo/zdV8Giig1xgpUHNjKIAiMOdxCLJSgMgqxWGkodNOkyrMqGgFQF3dNhvYZvz+88dx6Lzehmt1ToziG0bz9cTM5cblGRVR8Sa5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=q4gEL4O+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s0HUjiuL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="q4gEL4O+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s0HUjiuL"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HCThsW3334010
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=NvkY7Wn/mVI28OI750
	wXf7uHZwC1wUEP7GEqf3S+0Dg=; b=q4gEL4O+wjEtv4JIM99UL82xO06VPfl6Tg
	kECl2eXrwQxzE5y387k8QDRSp2qarwfJ+QAqI6mgMdNYaodKiULbapVwMzM3OL0O
	NayJPovn1/G77pBPmL+tsTtufXFmKSQJnCpuQ0Rbqws7QgebIYIhrhluhOn59QFN
	OmEqhU0jMOs7Y3qlWLludFslfErd/cWG3USrqdRPwcLp7pmZqar6eCY7kv3NiOtw
	7fZ6qfxSynBki35mN0BHyTG4v5BIgik352KTU+1tiTrYByI0SJ4tacrmQmr9M1qo
	gxG7QvAgCCYnueP4RFLrroi+Iuqxp+QUQE5Yy/sm9ntLN/T6W4/Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85qjcqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:04:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63HJ4PEk037381
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:04:31 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7nqmptx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:04:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7YYUQXohfiftND8eZStsjdvThgP8jepp1SFtHUkbX0nL+8I3horWff1qsOhIzYPKcOEPrpICx6aTtLlm8fOeDRWrIR4Pl10MtKIODIBRA1KfBkJgGO0Eulo+g7GfpCfcbmysBjqfa7cOaL5fO71Oc8R0HGkx+M/Q3CYlaxit9FY1V+h5YkMdoghX4gXGwEEVah73oKUTyoOaAUZl7gqZJCaQoJruP2LIaQ1kJrMZt61kzpQ7RYf3B3TRHb/yuaTcO0pwc1QLGz/Ckk8Xr/qPFjCLT1tqPy1nDodjGTrQDKlFOmI8A1g51z1r7C8nzEd6JBV9hS6rCWQU/w71vdVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvkY7Wn/mVI28OI750wXf7uHZwC1wUEP7GEqf3S+0Dg=;
 b=GNtZWHHNGSrID4VM3YJglfxH8LLWlB/9HDy/LnHpkqhV+ssV0FKr5o/XG0GyyERlJBqZzmIlAvX38dw6KsPfZc0KFdyHKkNGqpVoMuuFayWFtYALWI7aFPUS9EDeRtPxgsCW9h7w+kRgd4pNO7xiYCv59hDnwJZY3KivkhS0+pmWMdmeHpMkZc/o87ENejguEh5Yb1R4C2R0IR8BwFnIal4xrGCh/uwooD8OeneJScxsg0rnj+iyvLqWe711g3m0eRmIveByTH9GSexPJx98q3e+IkjlSmZijuSy7pe7wNKAEkIBNKq1jENC8bvpS89YsT8ZUiqeDf4mV+4IKOyvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvkY7Wn/mVI28OI750wXf7uHZwC1wUEP7GEqf3S+0Dg=;
 b=s0HUjiuLTw1hcwmNt8dlPnSahJUb4MXqMITgJfDP7v7QIzi8vBSufc9IQGsrqzrnSbhRpSjMG+iVsfJ4XuJ4Ek6H1HKuM+Y1+exJdbg/dnivNJyAv1m+s0jYgrBxAoTnWSfPU0RhJaF4VehJPDdqTJhgRhKKVq1EguZUJN5/zqw=
Received: from IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20)
 by SJ5PPFD020A49E6.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 17 Apr
 2026 19:04:13 +0000
Received: from IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a]) by IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 19:04:13 +0000
Date: Fri, 17 Apr 2026 15:04:11 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/4] btf: add dt_btf_func_is_traceable()
Message-ID: <aeKEKxIGoKdgzHiF@oracle.com>
References: <IA0PR10MB7325F8591942AB9F13EC9EE5C2252@IA0PR10MB7325.namprd10.prod.outlook.com>
 <87eckdzfb3.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eckdzfb3.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To IA0PR10MB7325.namprd10.prod.outlook.com
 (2603:10b6:208:407::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7325:EE_|SJ5PPFD020A49E6:EE_
X-MS-Office365-Filtering-Correlation-Id: e923e854-fcb7-4061-2a7c-08de9cb41d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 OjSyMNjDB4QHqk+nCh1BqSYEiEf4ez0m2Jo2xb3lQr0RN3BJ+xITGfneb29oeyxsveDZnnTwWoiAanwU7VHBlj8H+rjxdptsl42oNYVH8ed/ABz+JhdFG/uVnvwhJ1eNCfZdnQu0jduqwCwv0LdZXVUIyJ56ygKGRi91F1t7sTLdCNyadSVioT5uRAYn40PBgYmHmQs6ydOKAL3h4Y6G1Xx4PsMRK78wGeQt0IkVpNndXhnm5tzq6a0IIssi5xryYSO3Ro46Nfp5lRNMiRxzZCR8xCg2ev7Twb7seBaeOSKvIwDaZ5P46+7LNiHFGxJGEWrjEI4sDbbUkrGbjaGgcbuithYPXPRIaYHEx/D/Kr/A2UeHDpWRTmk6u5l4EawISXWtCnXL/lKrhAjn7R6LR+izzd+xE+fjRdHjoMpJVC8fAuymlm+X1NfzRziVpcRc+fc/BqwmLn+6vV6xzyVDmTGoks+KoIeJm/z29uaw27Xlc7RAzUdEysPTkfdeZURtQPYYz5A3hTNzuVpNnmvWLy0tLDzLCXmv6v/xp842NNaTQnn4Se6j+AyZE8NwYgjZE7faghk2rO9ChNzTZCZHwr+Of45ubOe/7jdxPyf6higne2ExjWL1iw0wXyfEChTbsCwarO4sNardcKQLupEN855V1U/Lvvw7m/yLupkGsJkyrKWbVV0PxjPqDu2xqDbJDz6qHeB2MBpCwHu9ccFuT89iNK0s0h0dilbemK+bw18=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7325.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2J64UtFcU0DZbMKpWrDpVIB+T7rLg4p057SZJAe3o5p+HJoJzb0q+ODOeaTu?=
 =?us-ascii?Q?eoFJz3XCkLW86C8kZXR+bmXxqXlzhyoK/IPR39RV96dwA6WBVwVfx+RxButy?=
 =?us-ascii?Q?LKs8FrPR1xd1qR0MH69ogvAbTKOtgrxzfTvJchASScONLlTJrqi/YrcyUPvi?=
 =?us-ascii?Q?anMpuQtS0al7WwP4UMmDXkWVAl66xkQB8SiN/YFOERdgHxkSPVdHl2waXWpO?=
 =?us-ascii?Q?V5s0YId+UX9/Af1uwGRxmvQLb6nRkHZbUbTc1jLNzidkxsemXBrP9lzRdH0X?=
 =?us-ascii?Q?S8l43tKtMGVSfzsLSNZjAMpXIhPJWTPpowlFnTjEPD6s3AisYzc829Um49P7?=
 =?us-ascii?Q?HyI6hTo4pferbVu4gaelo849+5/YDNaWjFi4ff/FA/Inik3QE2Gt3ghfRXiF?=
 =?us-ascii?Q?onnDbueINU28Zrn5iHCdAA5inzdm0j5xpfVjYKtTLymcSOITfOQ3dAkzqR8T?=
 =?us-ascii?Q?P/ZxNNpu3WISl6epLsdIOasHECDb3M6D40iZaojKI1KTSCkMRkEgjMdABX0N?=
 =?us-ascii?Q?68b9MPbJKKG4T1D9hp0/LTfsnnVOJPC1fLxnpTe3rMyH/Ut5XJQcjmtc/a+T?=
 =?us-ascii?Q?dh4EWvqtTLB1JAJxbi2uwgyNOfNkC0Ji9DtGoHZmIKqh1U/O11GspOR4ay8h?=
 =?us-ascii?Q?MvaoyVPh4AvAopBQTbjYpCRuic+0FGA/QOKxPxsm90obiUVR+2XZxthFVvKn?=
 =?us-ascii?Q?8MXpt/aVnER1kEFB60RKhU+BtDu9IzxXrWrgmEqmMgYxgYHHfrYRNT3IrmZA?=
 =?us-ascii?Q?kMJwoArRdJ9Npx9s0nrVL/JvNc2AQK3wRzvmGIpgVRcc6gVzJ9nqggW4ltvr?=
 =?us-ascii?Q?Ajsb82mPZNCzMJ9h/kSWfIg8+LzpNX+7cSU70lg1G3OL1BRNC0JWg5YMa7pn?=
 =?us-ascii?Q?yQtcwiot7xOD8vm//sY7MNXvk9UUX+rnjf/D0Iy1x9IUBp6G29g6goFnAqag?=
 =?us-ascii?Q?lTldTjB0AcaJjuzltzrw4UeGFKcJhUXqx0MiAvxtN0SoAAkpU4L4530DCDdW?=
 =?us-ascii?Q?DUhsIJmXs8aW//KNsUaLxYqL7fcfWMOVRhRzlGf1t/9c8YWddbLcD6NrIL/H?=
 =?us-ascii?Q?7Bt6YVzrltAO0vFNzpPXiplYlJ/Zo2e0kqCEeBJuxltt3tNhERNpSbAtbOPk?=
 =?us-ascii?Q?ztmhBjYGyDcHK/QZgIdEAvdY1vc4qEqfpA6RBz6mz1HZjtkHN6Q+j1g4JGnv?=
 =?us-ascii?Q?Gr6kJvav+uQuezp6eYtCf6odcvRZv46KiN3HBfnrh3j7W5NVQgTV9Hu7743b?=
 =?us-ascii?Q?cFgPLuT4kFkQk/87Xpjw4+YLO/xMxCaJ+HdGtdrxa+gBepo6Qg6RCrNdAf5H?=
 =?us-ascii?Q?DXTgjwcNoDRj4r8gyka5hG7ll9FAiRM7fX6+4OG4+0I8xoH6hVurJT7Xk255?=
 =?us-ascii?Q?hKfMIeEskadhRJcxZELZ/CgllDEOnyIorr7wAJjvpCagrAsIwk7qFdH/fhmw?=
 =?us-ascii?Q?W0B8Xd9yGvRcA5li0SjXxve2vvSLKIF5TuSGmyNmtXWjN7sl+g5BAT/AakjF?=
 =?us-ascii?Q?lzniKll3BlZaC4hGDg2FwOIcou1PKIyzN5+B16A3RsrM3Bg5bzXXzUHlZsal?=
 =?us-ascii?Q?objLvgNdGlmIieDNyymv3WlJnEzj6W/TrxsprI83bxSVSvtxaAabio8eDkmR?=
 =?us-ascii?Q?8VAiyjGpZwNfi10PFRbYlkqs/oVb7VeWY/qlElmO2AI5Uf//yjnVo/RXgIGk?=
 =?us-ascii?Q?B9DNLGOsg0H/Ock3qmHhttNv9EMgxwHNKESPTC4bbu1j8Lp56PezXTokkIsp?=
 =?us-ascii?Q?HX4mvUmDVA=3D=3D?=
X-Exchange-RoutingPolicyChecked:
 EYMUoFhTTEzksa3KFxaeDJT/EBA3TPBjDM4phjuZjVrlKsll9HHhTLYvy9RI1g0Yv2nOtBCndUzUyrpKyWrn6aRb5LNuTKlaY1o2ZQcxaBaV/QFEFZ2ec4kC6G0OLX+BCzEp7MdozAg5a5giofmzHn9Pn93EPgDgs8GRCR1wJTHSKi1AzYMJ+DAJxdn8swf6IOOzKCg4lrk00/VY12bpE722C2DaPdt8P/rgsHzmRzywIUCP0jKN4VGoNIE4aFcNL1SyjqeTBbEzyUFiAeLmV+7UFZdCywo/IVXu9Y8L3ud9rdgzrkPw6dcmttp3MtmNJQ16LeDwREVu/LZWEJ0iSw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 yWxKmeLlwXhZSXq0Q1fD/q6HE47QjLt/ZsOwAYV6xUyt4Uat87o/L4QYQI01rg2tR7JqaBVGyVpGHvWymqp7f6lVb0SG1g5pxJie67cMDYOnmUDLgEnANMCywvKcXKcRqtIKpZlue1/M6Asj8c2vk8kHy0F/OfZvZeXFy3VdQDyl8/pyTcFo4J7UcveA5/mxUjHqu2Ii3MX3vtPdn8xT/SugoCidWPuMd0tBUN2FXqizS1doJ3gV429VCfzC8KdJIqZXPDQSRl1TrgmFhcTZcE6qstUD4h49m8x2V+lR8e9KsNEsSL+JElutWXP4ev3QV/G5W8wnZXVeq+9ciQ14D+CHBDp4ATv6iaC9sl2F5n/xfL/tlSIfIuBtl3VWb1Q55HS8gDVjp+q9uDZJeoO+KttoMhVuAcm3U2dY51L2dv6PRDmfWD4NQV2RNbb0wRrp+brXnJaXtaRwZwqW7Fh3nLRi52/gC5N2tN0xrCn3e01uxXBu+GIBUUGqn4WMbyzPHfXddzY3xwjD6UQi/DIig8YN9IEpnWBgGjOz2vYECu4oMbmLKAPENFStNikLu5OQsp52BI/01Fe0ohQa6AaawGGlAci0g15qW9AzYRvU7zU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e923e854-fcb7-4061-2a7c-08de9cb41d69
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7325.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 19:04:13.5679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDnJGPoC13VxGl1PvyRiHai52K2VAr+zqYWcHOv0SBwuCJoEkqta+C2bg/V24dDrmm9cOxnk/ugjwk719faBicA1omBKjz9Hu1xijYdTA+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD020A49E6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604170192
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE5MSBTYWx0ZWRfX28LVjkY84Mol
 y5pYW3LTWF7QBH1qRMHMHxyHL0a77+D60rFi2UoFriRRB5jA8BP6q0/Dn+4YJELM9nVGUZmu67H
 1LPexrKvDp5Z5gfiecNKvFAjXyQM5mvQlIxZCkOJkhNq7gRkjbfxXw8VZiXfYsP9aCdgYPE++Zw
 uzE/TJszE6W/vlyUbyVImTlxe38EYOGpQxYYh1+FqTNjbdQYpG5eIxSzwXAlTuq1a55Mavd2PW9
 HyHBVGhXpGdcIJ4jztSFHUbL11uLnbq167b/j9cUL2jhYTfvfQKMgrwu9+LdQiYHuZ9OBKMZvGJ
 WC2piKdp60Y9zBt6YIHHj8ZfLQyhZyiEH+Gjeg96lOY7cwsQVfak15oxfnFPfvb2V9EJ+2ISpfz
 Bdmq8Se5Ud76HMYo6hb3EWrlOzbwqFsfCA5m2rkeeauAm/E7jxwX0QXa15i5+CBcKysSIR+3WIG
 PEfz9f/7WFtBE5iMJXg==
X-Proofpoint-GUID: V8xwb3N0qm3j_SznG--CbwkotdTDqNcJ
X-Authority-Analysis: v=2.4 cv=V49NF+ni c=1 sm=1 tr=0 ts=69e28440 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8
 a=7YcpU3IW_Zwz2h8M7mcA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
X-Proofpoint-ORIG-GUID: V8xwb3N0qm3j_SznG--CbwkotdTDqNcJ

On Fri, Apr 17, 2026 at 06:07:12PM +0100, Nick Alcock wrote:
> On 14 Apr 2026, Kris Van Hees spake thusly:
> 
> > Add a function to determine whether a function (given by BTF id) can be
> > traced using BPF fentry/fexit probes.  It implements checks inspired by
> > btf_distill_func_proto() in kernel/bpf/btf.c.
> 
> ... looks reasonable.
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> 
> (though you might possibly want to implement the suggestion below, it's
> very much optional.)
> 
> > ---
> >  libdtrace/dt_btf.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
> >  libdtrace/dt_btf.h |  2 ++
> >  2 files changed, 67 insertions(+)
> >
> > diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> > index 56eb96a4e..fbf377b4e 100644
> > --- a/libdtrace/dt_btf.c
> > +++ b/libdtrace/dt_btf.c
> > @@ -1020,3 +1020,68 @@ dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
> >  
> >  	return 0;
> >  }
> > +
> > +/*
> > + * Return 1 if the function referenced by the BTF id can be traced using the
> > + * fprobe/fexit facility.  Specifically, that the function is not variadic and
> > + * that none of its arguments exceeds the acceptable value size (16 bytes).
> > + * (See btf_distill_func_proto() in kernel/bpf/btf.c for reference.)
> > + */
> > +#define MAX_BPF_FUNC_REG_REGS	5
> 
> A shame we need to hardwire this. More of a shame that we need to
> hardwire it deep in a .c file where it'll almost certainly be overlooked
> when the time comes to change it. Stick it in a suitable header, maybe?

It is an internal (non-UAPI) aspect of BPF that is only relevant here, which is
why I chose to define it here.  I think it would be confusing to have it in a
more generic header file.

> > +int
> > +dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
> > +{
> > +	btf_type_t	*type = dt_btf_real_type_by_id(dtp, btf, id);
> > +	int		argc;
> > +
> > +	/* If no prototype is found, BPF fprobes do not work. */
> > +	if (!type || BTF_INFO_KIND(type->info) != BTF_KIND_FUNC_PROTO)
> > +		return 0;
> > +
> > +	/* If the return type is a struct or union, BPF fprobes do not work. */
> > +	if (type->type != 0) {
> > +		btf_type_t	*rtype = dt_btf_real_type_by_id(dtp, btf, type->type);
> > +
> > +		if (rtype == NULL)
> > +			return 0;
> > +
> > +		switch (BTF_INFO_KIND(rtype->info)) {
> > +		case BTF_KIND_STRUCT:
> > +		case BTF_KIND_UNION:
> > +			return 0;
> > +		default:
> > +			/* fall-through */
> > +		}
> > +	}
> > +
> > +	/*
> > +	 * BPF fprobes do not support functions that are variadic or that have
> > +	 * any arguments passed by value that are a struct or union of size
> > +	 * greater than 16.
> > +	 */
> > +	argc = BTF_INFO_VLEN(type->info);
> > +	if (argc > 0) {
> > +		btf_param_t	*args = (btf_param_t *)(type + 1);
> > +		int		i;
> > +
> > +		if (args[argc - 1].type == 0)		/* variadic */
> > +			return 0;
> > +
> > +		for (i = 0; i < argc; i++) {
> > +			type = dt_btf_real_type_by_id(dtp, btf, args[i].type);
> > +			if (type == NULL)
> > +				return 0;
> > +
> > +			switch (BTF_INFO_KIND(type->info)) {
> > +			case BTF_KIND_STRUCT:
> > +			case BTF_KIND_UNION:
> > +				if (type->size > 16)	/* value size > 16 */
> > +					return 0;
> > +			default:
> > +				/* fall-through */
> > +			}
> > +		}
> > +	}
> > +
> > +	return 1;
> > +}
> > diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
> > index d956ad940..2c921a033 100644
> > --- a/libdtrace/dt_btf.h
> > +++ b/libdtrace/dt_btf.h
> > @@ -28,6 +28,8 @@ extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
> >  			    uint32_t id);
> >  extern int dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf,
> >  			       uint32_t id);
> > +extern int dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf,
> > +				    uint32_t id);
> >  extern int dt_btf_get_module_ids(dtrace_hdl_t *);
> >  extern int dt_btf_module_fd(const dt_module_t *);
> 
> -- 
> NULL && (void)
