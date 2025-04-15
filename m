Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BEE291157
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718357; cv=fail; b=t+1A75jv6+9SyApr4So5Va5XK49bRKhrA0W73q0kekha7cb2pB4ePVqs+uUsWXMmSNOxXuqWzLaUoQhPvH9VjYyt5w+R0WCXn+hLKdgF8a7ksPOOfoQnuNybFC7kgW0NoOYaOSdWVpVijC0/hlF+WxXs7SwSYeRZqnZd8iZWNmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718357; c=relaxed/simple;
	bh=G+sbZsMfen2+l4reVpa1tCH8DbAJrjHWr0mh4tGsZ/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fMotVX3+W1UWXZwCngci6UzWPsDTl/eYrUh+YLam154MTkRvforeVl5BTBetI24RzSF3N6quQDmQrVpJWz+JubRgoEKYaOsN+Vvi49aukYJ2gSOFYKHzExkEx69+geoR7CUHhDmdhQ1KHl3H8Gh/lHVhK6sb2DjKs3QYHli8FBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Axy2RRM1; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IUu9ohh0 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Axy2RRM1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IUu9ohh0"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F6frQo004652
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 11:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=hEbDGUXNs2LhhSIBwRPaGHRWyOh1p6MQ7H7dl78A30Q=; b=
	Axy2RRM109RhsSEwEzNfaCt/bSixp/8PQQVgiCdM4WR+rHfiPRycgWQ2EloZUWMp
	Yw/JjajxJP023bypIidOAp+NLoeeBJ7rPqpqaqIOgL2vRxxlw/LMnGhuuIN2yS/W
	JC4NfLhbE6sqURX9TlXGFhgEJ0zQzsL2TaRt9dGjGFZVOzmXDfSHq4fWOZBTPWGY
	1cvEJureeNdpZLsr33+EwMi82l/gxhDDJ7vSDOs4dSEqirDZBg/Es2upseQOxNzg
	Zck2NVYmBo3BkNKSqo+jCmy+4aEgMRKUNUgj0VJc3FfEWrEMZWfoEwevTD0h2PuW
	T+E9raK4pISRVzzLNz091A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46180w9h3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 11:59:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FBK6v4008543
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 11:59:13 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010005.outbound.protection.outlook.com [40.93.10.5])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2px9a4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 11:59:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6X7TeuAHN+VUHpxIrIM3+anxKeJSDOqU0Y8Z1mGEoc5GqvX+7Rf30Ny/sFYx2/8cn5D0jumoi2ql+B9sqHVOm1tjktToILEUIe1KRrNn5XdYCROryqgC/pYrxIrMWoT3U7nBXikiyEy/N0YH2Rpk9kA9tY26a6etFzocOme0oZWpXRj/7r+MVZ1ph0Yl4WIPl2Taen3rwz/I/ZbsNMYxPSIEpTja7dLGdAqtmH3xXccazrz6oL44TDD+FbhQqx+3aM3WXdC7lcYg56BVFHHkcqzPRRUj/1719VAPNinHTRRF9ik4sRDS5hrC3ZywlImrKdtLLaRexsB1PHbK29dbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DggxvnI+/DuD2+gK1UQ8QMe377z9QDmpBLfCTLq8zI=;
 b=LQiyRd8reQU+Qjj72/u37jTbkQHcxTr9HK/cvv9xEGETC0RKREdVQqLoPxi1bzylqeqWyOn+4miYve7OG0lRv24wIjgiEim8BpgF5xwXBf+A70yqDE5mqApaX/u/Q0hcJJFrGoJDGFtrDB2vW25Vg7P0WEeSxAYFlVXPavHdYohRLillNGdHhaLQkQlX+n5hANicfeYUnhug/SksTIdGOM5+QhMt9nzgTfEbfefxlEtPN1OF5xaeie6yJIWOSe9mGHuAasnJMReqNo3cIhje+mrj/BCySlaKAB2RvzD7uQvKC3EUTYKWfBcYOFFjm1tqD+sYyJhahJALDmeZaWkJrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DggxvnI+/DuD2+gK1UQ8QMe377z9QDmpBLfCTLq8zI=;
 b=IUu9ohh0MXR6+gNp+plYawJA2SrNpfj7yNkrfN1vMk6BaAOo8XZb625p02IUM8EbmYSO/eWlYaVOzCec8SaM1hYiOV+UBMYZmxhrCdL/+pHMibdADNt27T6eoM2S+acJEeeXm4S5Gws0maodmeJmxxcEpHMhLljiXcDxW89zs3Q=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by BLAPR10MB4849.namprd10.prod.outlook.com (2603:10b6:208:321::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 11:59:09 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 11:59:09 +0000
Date: Tue, 15 Apr 2025 07:59:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 2/2] Clean up sched provider trampoline FIXMEs
Message-ID: <Z/5KChRZYc4M1eIp@oracle.com>
References: <20250403050252.15239-1-eugene.loh@oracle.com>
 <Z/mAC5DG2gl0W8Sn@oracle.com>
 <f9f7221d-ee7c-b10c-b677-de3b38d86181@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9f7221d-ee7c-b10c-b677-de3b38d86181@oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|BLAPR10MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: b907e9b9-ed32-40aa-242a-08dd7c14edd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?7oFdds1herQk99oKBrbbpHLwwXwHO3Zw1QkG2qnBzMKTvabgkYKbSjPTz1?=
 =?iso-8859-1?Q?YcpZc+6URB/RI2fcEW+nQoJPCRZrFipg6j+ZDn8AifNy0BjqIi7/PFPgMh?=
 =?iso-8859-1?Q?QTRU3ZwR7srxSpURE2tMzhaE94jHBVTi9PE9yyjEdKEVfSMDPZ7fJ3VqnL?=
 =?iso-8859-1?Q?einDGrVfyZJc1JDKK+dcbGKnG9itcFT+ZXD+F279N6zar+iF9+kAHT3atV?=
 =?iso-8859-1?Q?KOMCS5YFO6QS8TY/dk8HUHY1y+MRWUTPuvbR0j7D1OENMOqZDTe4XO2puG?=
 =?iso-8859-1?Q?L/HMcEO0UJJVyHgYfaBY8fElyutjffgdKRJiCAx1DUz4lMoKZPobXBbwy9?=
 =?iso-8859-1?Q?QgulhH1gHiSqw8VczDWImRPjhwD+OFspNXEFq5vUn5+soHbBCvRpmIaIBr?=
 =?iso-8859-1?Q?FOQzAXe3RVSwtC7zgurAn9uLJ4Xy9Ug40F8NgpfiEGQdRfiBHzGrunTQhX?=
 =?iso-8859-1?Q?FNFA16dh2CxSC+GN7BUnhTz1w0HYtfJaQT8Qfo4CgJ+l4v4XS6/jE7Q2SZ?=
 =?iso-8859-1?Q?Oxd46mEP5brjPhAdAa8dd00k4ob9WT4+Xh8tNFGh3gB4cmLNk2FTMtZ73v?=
 =?iso-8859-1?Q?DeT2qZ9fDte4kyjhQovBrvkSbBNWS1CJLjt75FLtv28WfvlVVQBBzUHHxz?=
 =?iso-8859-1?Q?u8nKFH7vGJTkBVim46dtS4Jv1hqOfBdQ9ETYVtoaeOiYsx80guMRoKEoWU?=
 =?iso-8859-1?Q?y1gYj47z7s5xDQRbT2euNZJXAej/dMR4pIBURpuljLhEb8lHi22oX1haYl?=
 =?iso-8859-1?Q?04/lieoLuFQdYcoblROltu2obMjiNmukDr13oGWiXNYHVTPjB3OZLnq9CB?=
 =?iso-8859-1?Q?SwWLbWt0AFVGMI30S414gmhgqPjFMGW4WUWFT25qHCpyThlEXNtM7vH0dp?=
 =?iso-8859-1?Q?dFVFiv59iDKY69GWeUpWHbAVmQ2dvsxtPBMyxGks9bcauVLFHyJjYd/Boo?=
 =?iso-8859-1?Q?uwN+iB/9ZBNoxK2x8ai4oEFQG7IwOcqNeQWY4Pq5yvVPvZI1jqrCZu8HtQ?=
 =?iso-8859-1?Q?iEZs7IILlr107M8m2Zp+tQk5de2b3QgntMtX+MKoryZnBlgQzROSrbwuQK?=
 =?iso-8859-1?Q?WfXLkp/l/jCwyZSZeEVunvbgZ3KFAIhhWt9kZAiIdgHUTPc/zI/PQvCfZp?=
 =?iso-8859-1?Q?gkUqcIRqE9WPbqOl3nKa+B8Lya7tqcjBGsqDuCphMK1x57fehPpiuSArgs?=
 =?iso-8859-1?Q?Q0K0lZ2bWN2LVi8BBAvrHKQBk+mxWQEM9mPT3FqNh0vhNb1mP04OEVSxE4?=
 =?iso-8859-1?Q?1/1ztrxuukq07jje771b0a0bB9Jfcvbco96aR9BVfGa50y81iJ45qnw2gO?=
 =?iso-8859-1?Q?cn+AQ0JbHIfRvkPrTnv9HX6jMEPC2Xjdh23vzsOfD/wZ7sjfbuhJsukPz9?=
 =?iso-8859-1?Q?1Wq7HioAbFJhTvUyDZaEaEtM+bzGj0raw999gho9elZpvl2jYEiqpbwkCu?=
 =?iso-8859-1?Q?Ado1dNGytwig4IGLHe1YAxaEynYsSIq+/CxtC+oBe0fvu0n5SKFy/q36Hh?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?p3qXgA6zdfluMOJCLamaUUK166P0T8T1JuC+rou/aF1vhMK6wSDvmDKxjG?=
 =?iso-8859-1?Q?/R57eSgN4EBEvThgllIhGh4eSpJkioL8syuB11kQ2ERB5ioC28Lv06zVF+?=
 =?iso-8859-1?Q?OxiqTO5icU5mrsMRH+fXU4iPhEEH26bYeLAhFLC7Z7nOBQ0WedunmZFstk?=
 =?iso-8859-1?Q?fJ2AY2TO2pnTvJSjGQA5DtlL/GccPmw95VXbQ40NfsySB2hJuq38B8UmvD?=
 =?iso-8859-1?Q?GFpPeqayUtYLZoldXTgLYFn2EPCA/9i4uSk6inS81Jx/0f18SFpRLecm15?=
 =?iso-8859-1?Q?XJnBVvcxCWxkWAC7TU7OMHZZobCIAT+hLjH/BQxJVvidDD0lIGwTJkf1ba?=
 =?iso-8859-1?Q?5PupSokXewG/sZTujZcvL/p5KczqGkFhp7n2wVH8Q3/Tx3zUqJYp/MwZ0/?=
 =?iso-8859-1?Q?GRGdgScthMUD6ZxQb9+8Ve7s+ZmOQZTdvMFiXIGA5yRtFQO1V45TUd9p1g?=
 =?iso-8859-1?Q?W6LOlV3G7C38RvpNmls5as1roFxWMBey/wGFQy4/49E2okbJk7uiwJfJ2v?=
 =?iso-8859-1?Q?uUScgHI9ZIJo845zqDFk2hyuUWtdbmgZx4P17XtL6nYPpFwDsK7C67vfGC?=
 =?iso-8859-1?Q?hFRROWYhjLtF7PA32XeD0Sf+nkotz/nW82mmJg6E55TAWCcPjEJQkcN94w?=
 =?iso-8859-1?Q?ayONjDE30RxkYuef2cpqjoZrCx4TeNYYUFdTteR5ssBLjw2anSWFJZZMV8?=
 =?iso-8859-1?Q?xt8ZVgWiR9omzXlwkVoTY48cL8+KJN43RwXj/oc4nQRdTyMxOayw31dby3?=
 =?iso-8859-1?Q?7WExEt8PKIGPTjsM62c+c4kt+p6jscRBNSFrLq9X+Fuw8FG5T9R19DAkeh?=
 =?iso-8859-1?Q?lA9QWMZSRMmqFico+RQWH4x2idkAF80QUf5cuTmnUxsmsTVpOc6rtCAiEO?=
 =?iso-8859-1?Q?l8s61tJTTZDU1YSqEKb4sLUlayPeY4lbKaQESlFgXMuK7GhHvDqhU30swl?=
 =?iso-8859-1?Q?GQN9FSUMVMxUb7AtoxjDSiwjcHlTidR2M2lCwRr0c5Mx/pFDzSK7tygL7E?=
 =?iso-8859-1?Q?QMxJi3HOIVlPOMQZFLZkYkLVOKVcviQQgDVoBoXf2xg94Lfrsz/BqxYTCQ?=
 =?iso-8859-1?Q?vjc1Fxa11tPfB9q/c6NGOjhlcsrfKs2thlgXKUuseTtgfORzENF+7PzELQ?=
 =?iso-8859-1?Q?MYIY7fD6jab3SwP6GiXHW7VM0mI9vZyPh+Q/xV/WnGo8OuJZNDmR/Qq/o/?=
 =?iso-8859-1?Q?ed6m9JIkTqbzLKSMTlEhEi5va7Acw1evg7J0N/VePKPLgS8GWfapCRi0gg?=
 =?iso-8859-1?Q?i5tJ8FEqK682vsuBMOCV70BJ7GUScyrPZ+WPBTq0t5qDE+FAF3N1oqO9Ep?=
 =?iso-8859-1?Q?moOIpfq6pe0dRB7uUBD6z6G0L2jtiILfP/Fif4bu+b8zRdZBOxUpSf5s3h?=
 =?iso-8859-1?Q?2LdhRIxQH1ihQwa3YmjOc6/uX2mEKa9Nxxvh8Jpv3A/Nt82sCTntUMT3fM?=
 =?iso-8859-1?Q?Cy18/FSqdfzPe1SwRdqyFFJrllS6Z7lCV7tG6s5P5yyrWrehXyyAwe5PAQ?=
 =?iso-8859-1?Q?43TlJ9B0iKKq5RIdn9dzp32ex0VAry1igaFsc58YRFXZFJBkfNVGhj66Fk?=
 =?iso-8859-1?Q?zlQkOeX6WGy2LqpcbE7IzoDPg7//lKfm0dld6FMA9c2t25uGCYVWlmbnaT?=
 =?iso-8859-1?Q?SwcDUq5aCjJGTCgyu4pSKpCGOR3OY7az0+uFuMfygrj/z98jqRo/nMdg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fZlgQhI01k55VwAQY1bCLla3GUUpJjHIvcYKZBLelagkTKLE+C5/Z8iqqGQC+76h0jFy3EVF8aIQS1MmL0nMnIL+/hw8jG0oFXW9DLzHSj0tVH5bA2MJDUHWulOErv22ETt9OQXuZWTP3Dj2bzmI+aVpnZhBIWROjqR3I/73vO4AatQGK275382fxHAa/HK4o7d2vBElXrPWNKWV6mMSHHaB5ZLhR1EThFb4+M1BCmY5bJ3O25F2TwTffA/cNE9Dm6x1ilrcM0E/yVDPmiW7JGPpSoPBaXcjM0bjXPPvWWlvkXdahbKsFftuGXWcDeHfHw+mHeWNx5m823c6IvzDT2DdKUAwZRtzGN/OuCDjdYjSXS++gsMwG0QIP+FgOHsUX+rHTCQYEZ1vSBOCA9nfDZt1t8xkbARqEGQOQYHNTe2FmA6F3hguVdzQuyMViyohBShxm+nFV/VZMvySk1JOyyaeBvRRqLt+EbRbdU0jdVxs+hmCmo/NRMk14k22CWKlijaLJq7enwwZ9eoj6WHXvTDqUQ5BRe1h5u8y+e6XTZtRgc/G+2OG1KbWU6vBPm76Sf5xIEAVTdzOBwSqR9DXXRuBZzFQ95siKbQbdWP4Zv0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b907e9b9-ed32-40aa-242a-08dd7c14edd5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:59:08.9520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1nP68UkQHcU4hCVUdEgEsMLaDl61r0YCiWFp3pQLZGpWw28oeFa4JrE+XnQEFJV7McFjgJMxJwF4i/NTxeHQGtEbCOl3t9WjQcq8yHiSxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4849
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504150085
X-Proofpoint-ORIG-GUID: JmMO1nnmBf9Wfo12Jwm3p5VY8wuNHZPa
X-Proofpoint-GUID: JmMO1nnmBf9Wfo12Jwm3p5VY8wuNHZPa

On Fri, Apr 11, 2025 at 05:20:00PM -0400, Eugene Loh wrote:
> On 4/11/25 16:48, Kris Van Hees wrote:
> 
> > Partial comments below (still looking at the provider changes)...
> > 
> > On Thu, Apr 03, 2025 at 01:02:52AM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > The sched provider trampoline for enqueue and dequeue probes had
> > > pending FIXMEs for providing a cpuinfo_t* for the cpu associated
> > > with the run queue.  Implement the missing code.
> > > 
> > > Since the cpu associated with the run queue might be different from
> > > the cpu where we are running, it becomes necessary to access the
> > > cpuinfo for some random cpu.  With Linux 5.18, there is a BPF
> > > helper function map_lookup_percpu_elem() that allows such lookups
> > > on per-cpu arrays.  To support older kernels, however, we change
> > > the cpuinfo BPF map from per-cpu to global.  Also, it is a hash
> > > table rather than an array in case cpus are not numbered consecutively.
> > I agree with all the above.  Good solution.
> > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   bpf/get_agg.c                     |  2 +-
> > >   bpf/get_bvar.c                    |  2 +-
> > >   libdtrace/dt_bpf.c                | 34 ++++++--------
> > >   libdtrace/dt_cg.c                 |  5 ++-
> > >   libdtrace/dt_prov_lockstat.c      |  4 +-
> > >   libdtrace/dt_prov_sched.c         | 74 +++++++++++++++++++++++++------
> > >   libdtrace/dt_work.c               | 20 +++------
> > >   test/unittest/sched/tst.enqueue.d |  1 -
> > >   8 files changed, 89 insertions(+), 53 deletions(-)
> > > 
> > > diff --git a/bpf/get_agg.c b/bpf/get_agg.c
> > > index c0eb825f0..e70caa6ef 100644
> > > --- a/bpf/get_agg.c
> > > +++ b/bpf/get_agg.c
> > > @@ -21,7 +21,7 @@ extern struct bpf_map_def cpuinfo;
> > >    */
> > >   noinline uint64_t *dt_no_agg(void)
> > >   {
> > > -	uint32_t		key = 0;
> > > +	uint32_t		key = bpf_get_smp_processor_id();
> > >   	dt_bpf_cpuinfo_t	*ci;
> > >   	ci = bpf_map_lookup_elem(&cpuinfo, &key);
> > > diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> > > index d372b3445..d81c3605f 100644
> > > --- a/bpf/get_bvar.c
> > > +++ b/bpf/get_bvar.c
> > > @@ -67,7 +67,7 @@ noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
> > >   noinline uint64_t dt_bvar_curcpu(const dt_dctx_t *dctx)
> > >   {
> > > -	uint32_t	key = 0;
> > > +	uint32_t	key = bpf_get_smp_processor_id();
> > >   	void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
> > >   	if (val == NULL) {
> > > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > > index 6d42a96c7..d6722cbd1 100644
> > > --- a/libdtrace/dt_bpf.c
> > > +++ b/libdtrace/dt_bpf.c
> > > @@ -761,37 +761,29 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
> > >   static int
> > >   gmap_create_cpuinfo(dtrace_hdl_t *dtp)
> > >   {
> > > -	int			i, rc;
> > > +	int			i;
> > >   	uint32_t		key = 0;
> > >   	dtrace_conf_t		*conf = &dtp->dt_conf;
> > >   	size_t			ncpus = conf->num_online_cpus;
> > > -	dt_bpf_cpuinfo_t	*data;
> > > +	dt_bpf_cpuinfo_t	data;
> > Not sure about this, because (see below)...
> > 
> > >   	cpuinfo_t		*ci;
> > > -	/*
> > > -	 * num_possible_cpus <= num_online_cpus: see dt_conf_init.
> > > -	 */
> > > -	data = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
> > > -			 sizeof(dt_bpf_cpuinfo_t));
> > > -	if (data == NULL)
> > > -		return dt_set_errno(dtp, EDT_NOMEM);
> > > -
> > > -	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++)
> > > -		memcpy(&data[ci->cpu_id].ci, ci, sizeof(cpuinfo_t));
> > > -
> > >   	dtp->dt_cpumap_fd = create_gmap(dtp, "cpuinfo",
> > > -					BPF_MAP_TYPE_PERCPU_ARRAY,
> > > +					BPF_MAP_TYPE_HASH,
> > >   					sizeof(uint32_t),
> > > -					sizeof(dt_bpf_cpuinfo_t), 1);
> > > +					sizeof(dt_bpf_cpuinfo_t), ncpus);
> > >   	if (dtp->dt_cpumap_fd == -1)
> > >   		return -1;
> > > -	rc = dt_bpf_map_update(dtp->dt_cpumap_fd, &key, data);
> > > -	dt_free(dtp, data);
> > > -	if (rc == -1)
> > > -		return dt_bpf_error(dtp,
> > > -				    "cannot update BPF map 'cpuinfo': %s\n",
> > > -				    strerror(errno));
> > > +	memset(&data, 0, sizeof(data));
> > Do we need this, because (see below)....
> > 
> > > +	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++) {
> > > +		memcpy(&data.ci, ci, sizeof(cpuinfo_t));
> > Do we need this, because (see below)....
> > 
> > > +		key = ci->cpu_id;
> > > +		if (dt_bpf_map_update(dtp->dt_cpumap_fd, &key, &data) == -1)
> > Why can'you we simply do:
> > 
> > 		if (dt_bpf_map_update(dtp->dt_cpumap_fd, &key, ci) == -1)
> 
> I think the problem is that the BPF map has elements with size
> sizeof(dt_bpf_cpuinfo_t).  Meanwhile, ci has size sizeof(cpuinfo_t), which
> is smaller.  So if we do an update like that, the map will have stuff where
> we want it to be initialized to 0.

Yes, but I am 99% certain that BPF maps are allocated and initialized with
zeros because doing otherwise would be a major security risk for the kernel.
So you can count on that (should verify first to make certain but honestly
it needs to be or else it could leak data which is a big no-no).

> > > +			return dt_bpf_error(dtp,
> > > +					    "cannot update BPF map 'cpuinfo': %s\n",
> > > +					    strerror(errno));
> > > +	}
> > >   	return 0;
> > >   }
> > > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > > index 6dcf4cd3d..d83b1c2ce 100644
> > > --- a/libdtrace/dt_cg.c
> > > +++ b/libdtrace/dt_cg.c
> > > @@ -1243,9 +1243,12 @@ dt_cg_epilogue(dt_pcb_t *pcb)
> > >   		} else {
> > >   			idp = dt_dlib_get_map(dtp, "cpuinfo");
> > >   			assert(idp != NULL);
> > > +
> > > +			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
> > > +
> > >   			dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
> > >   			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_2, BPF_REG_FP, DT_STK_SP));
> > > -			emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
> > > +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
> > >   			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> > >   			emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
> > >   			emit(dlp, BPF_MOV_IMM(BPF_REG_1, 1));
> > > diff --git a/libdtrace/dt_prov_lockstat.c b/libdtrace/dt_prov_lockstat.c
> > > index c73edf9be..8b2cf4da2 100644
> > > --- a/libdtrace/dt_prov_lockstat.c
> > > +++ b/libdtrace/dt_prov_lockstat.c
> > > @@ -121,11 +121,13 @@ static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
> > >   {
> > >   	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
> > > +	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
> > > +
> > >   	assert(idp != NULL);
> > >   	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
> > >   	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> > >   	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_BASE));
> > > -	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
> > > +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
> > >   	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> > >   	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
> > >   	emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_0));
> > > diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
> > > index 3a218f3cb..a548e679f 100644
> > > --- a/libdtrace/dt_prov_sched.c
> > > +++ b/libdtrace/dt_prov_sched.c
> > > @@ -84,6 +84,40 @@ static int populate(dtrace_hdl_t *dtp)
> > >   			       probe_args, probes);
> > >   }
> > > +/*
> > > + * Get a pointer to the cpuinfo_t structure for the CPU associated
> > > + * with the runqueue that is in arg0.
> > > + *
> > > + * Clobbers %r1 through %r5
> > > + * Stores pointer to cpuinfo_t struct in %r0
> > > + */
> > > +static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
> > > +{
> > > +	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
> > > +
> > > +	assert(idp != NULL);
> > > +
> > > +	/* Put the runqueue pointer from mst->arg0 into %r3. */
> > > +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
> > > +
> > > +	/* Turn it into a pointer to its cpu member. */
> > > +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, dt_cg_ctf_offsetof("struct rq", "cpu", NULL, 1)));
> > > +
> > > +	/* Call bpf_probe_read_kernel(%fp + DT_TRAMP_SP_SLOT[0], sizeof(int), %r3) */
> > > +	emit(dlp, BPF_MOV_IMM(BPF_REG_2, (int) sizeof(int)));
> > > +	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> > > +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
> > > +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read_kernel));
> > > +	emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, 0, exitlbl));
> > > +
> > > +	/* Now look up the corresponding cpuinfo_t. */
> > > +	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
> > > +	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> > > +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> > > +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> > > +	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
> > > +}
> > > +
> > >   /*
> > >    * Generate a BPF trampoline for a SDT probe.
> > >    *
> > > @@ -98,18 +132,39 @@ static int populate(dtrace_hdl_t *dtp)
> > >    */
> > >   static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> > >   {
> > > +	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
> > >   	dt_irlist_t	*dlp = &pcb->pcb_ir;
> > >   	dt_probe_t	*prp = pcb->pcb_probe;
> > >   	if (strcmp(prp->desc->prb, "dequeue") == 0) {
> > > -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
> > > -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> > >   		/*
> > > -		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
> > > -		 *	  associated with the runqueue.
> > > +		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
> > > +		 */
> > > +		get_cpuinfo(dtp, dlp, exitlbl);
> > > +
> > > +		/*
> > > +		 * Copy arg1 into arg0.
> > >   		 */
> > > -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
> > > +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> > > +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
> > > +
> > > +		/* Store the cpuinfo_t* in %r0 into arg1. */
> > > +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
> > >   	} else if (strcmp(prp->desc->prb, "enqueue") == 0) {
> > > +		/*
> > > +		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
> > > +		 */
> > > +		get_cpuinfo(dtp, dlp, exitlbl);
> > > +
> > > +		/*
> > > +		 * Copy arg1 into arg0.
> > > +		 */
> > > +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> > > +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
> > > +
> > > +		/* Store the cpuinfo_t* in %r0 into arg1. */
> > > +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
> > > +
> > >   /*
> > >    * This is ugly but necessary...  enqueue_task() takes a flags argument and the
> > >    * ENQUEUE_HEAD flag is used to indicate that the task is to be placed at the
> > > @@ -120,15 +175,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> > >    * outside the kernel source tree.
> > >    */
> > >   #define ENQUEUE_HEAD	0x10
> > > -
> > > -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
> > > -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> > > -		/*
> > > -		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
> > > -		 *	  associated with the runqueue.
> > > -		 */
> > > -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
> > > -
> > >   		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
> > >   		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, ENQUEUE_HEAD));
> > >   		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> > > diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> > > index 498d5332a..2167ed299 100644
> > > --- a/libdtrace/dt_work.c
> > > +++ b/libdtrace/dt_work.c
> > > @@ -37,35 +37,29 @@ END_probe(void)
> > >   int
> > >   dt_check_cpudrops(dtrace_hdl_t *dtp, processorid_t cpu, dtrace_dropkind_t what)
> > >   {
> > > -	dt_bpf_cpuinfo_t	*ci;
> > > -	uint32_t		cikey = 0;
> > > +	dt_bpf_cpuinfo_t	ci;
> > > +	uint32_t		cikey = cpu;
> > >   	uint64_t		cnt;
> > >   	int			rval = 0;
> > >   	assert(what == DTRACEDROP_PRINCIPAL || what == DTRACEDROP_AGGREGATION);
> > > -	ci = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
> > > -		       sizeof(dt_bpf_cpuinfo_t));
> > > -	if (ci == NULL)
> > > -		return dt_set_errno(dtp, EDT_NOMEM);
> > > -
> > > -	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, ci) == -1) {
> > > +	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, &ci) == -1) {
> > >   		rval = dt_set_errno(dtp, EDT_BPF);
> > >   		goto fail;
> > >   	}
> > >   	if (what == DTRACEDROP_PRINCIPAL) {
> > > -		cnt = ci[cpu].buf_drops - dtp->dt_drops[cpu].buf;
> > > -		dtp->dt_drops[cpu].buf = ci[cpu].buf_drops;
> > > +		cnt = ci.buf_drops - dtp->dt_drops[cpu].buf;
> > > +		dtp->dt_drops[cpu].buf = ci.buf_drops;
> > >   	} else {
> > > -		cnt = ci[cpu].agg_drops - dtp->dt_drops[cpu].agg;
> > > -		dtp->dt_drops[cpu].agg = ci[cpu].agg_drops;
> > > +		cnt = ci.agg_drops - dtp->dt_drops[cpu].agg;
> > > +		dtp->dt_drops[cpu].agg = ci.agg_drops;
> > >   	}
> > >   	rval = dt_handle_cpudrop(dtp, cpu, what, cnt);
> > >   fail:
> > > -	dt_free(dtp, ci);
> > >   	return rval;
> > >   }
> > > diff --git a/test/unittest/sched/tst.enqueue.d b/test/unittest/sched/tst.enqueue.d
> > > index f445ac843..28dcace8c 100644
> > > --- a/test/unittest/sched/tst.enqueue.d
> > > +++ b/test/unittest/sched/tst.enqueue.d
> > > @@ -4,7 +4,6 @@
> > >    * Licensed under the Universal Permissive License v 1.0 as shown at
> > >    * http://oss.oracle.com/licenses/upl.
> > >    */
> > > -/* @@xfail: dtv2 */
> > >   #pragma D option switchrate=100hz
> > >   #pragma D option destructive
> > > -- 
> > > 2.43.5
> > > 
