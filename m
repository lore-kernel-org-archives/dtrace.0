Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC33198A31
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 16:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728664236; cv=fail; b=EB6rruJ9BvpIedY8sChaSyjnWggzpmBGvV+Pz+PuDqtbogvvZBvFav1dtwJ8TtZpFVb7QWpvq2r29T4KhF24CB4dLeA7QIm+YErg/V+JMgrSvoElaaJCFnzx1G1Pb1fXfr0ykIeXm5F1ONlimQ84gsRsh3E2Gal2T7i9H11FTmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728664236; c=relaxed/simple;
	bh=cy5AvoH9xDsrbKepbhMPWFyx/JK7SHHcg/WjUJzGCD8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=krypXnnQ0VZza5E5CZh5BZwFesoMI0pMgXrrAqdGXmBjvtGx+MvGc92LsCKrdEg8NksFrEv9UPAOnfi+JYyrMyv4rAXthabg6BtYJIIE60SnsBk02fJsSt0POM17h2aX3A4G2ze9KfJ2Fiyn1dPWaVj87Rhz6qFr6PSA4Y+7ZA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I8iRudue; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GZhdX0fk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I8iRudue";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GZhdX0fk"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BCpVZx015026
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 16:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=PraCcZTZp03KHAK+jZdTVXGhjgsmJW7eyR4kOT5qJho=; b=
	I8iRudue8BYQs8bvSZ7IxWQ/s6iaK8uCK3eOvzVfe7U4oULhQ9Qd+b10bP18Lzam
	bCjSg+f73HudvE4wcbAT9KicsjBfjAfdxyHGGpwaWtA6P4TWp2VmrpUiyDfi1EQ4
	3tJmZ7zK+Fp1VUJ5V1fMeV7oVErlQoeFued9+1PnFJLaZ72uL7MHSFpGlH7hA894
	ygyeJKIpUxdw/mqMDwVNk993Rms7R3tZzYW9kGmF859lWGCEjzgr8u83BoiwjGnp
	iQMA6SoloN2lnoE5r+212HM83os50FxBLsxg5aZGtK/u0Ot7vmHtkTg3y0y4k+h/
	RMQ60boC7BeCu6ylFaZ1cA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42300e5bbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 16:30:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49BGApbj028044
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 16:30:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwhtea3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 16:30:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whqLGnIGC/WpYnczia6ZbU5B5wDyzV5LUbPSnOqid5ntd6/3XzsAL1UUWm/6uWfikoyPKr/GDUm2DapVnaFuJ/NIMDWLSX+B6j4VvwvbhVB6LFbr4EbVDFIc6pMVNjm6dHc5BHc2knIlO7SA3L5KP+xzF1i80jhaoG2fU5z4CS931jz3fjKdaBBE5s1BaSRZe/IZmqnhFZMeP5yOf65C5Xl/duZrzTLfNzZkts8gnlsqRD4z/3UC6XRow0SRTSekVlZZlklhPTYOTmrH6XpAPlCVOTGMkbnpbepY4ZsgrU4IiptikD8IP8uPsxqAw65XJUzYdAK0i/h6lURL/c/J1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PraCcZTZp03KHAK+jZdTVXGhjgsmJW7eyR4kOT5qJho=;
 b=wmJOqQvi+X9r9eTBr+a7Zgb531PQzilu5K6c9gpMgAOv2fzqgNoYw6fFt0F4nCY5B6dL+sy+LWFBAgZoiBAgjct6+HAl9j4o46npcFRZ4huzhJrKtE6HZQtKglvv/oZsv9DVEfIh1yVhwVWgOhQReirEYKNRYylH1tSO85VM9DTtO6wRWkc8Cw73gKvv2GQDJTSByqh2lZRckt8pzyAcD79ut0R6MKg+AZO0Xtdx6WXOSGBrbvLpwu42QiqDE+V6oKQodZvv1ZoeI5xOfMdRwUWxP9QbN3a/Nh8SiM9lhAuWROdZJObgkiw6TRaT61mDLtujXnI3YIqFR1LUE9gsqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PraCcZTZp03KHAK+jZdTVXGhjgsmJW7eyR4kOT5qJho=;
 b=GZhdX0fkCXCFvgljGVVJTUFSJkdlx1jJV17msBU2zCVSecUCxW2XCv8sq8AaMCdrzqwNHI5VZCN1loN1cS47gMhqKOK0yiwY6ZlIRtV8WW/KVBPbsEo+5E8ng+ntwVrCivv2SRzOMvOV2Pe94lpGauJr6q62exuwjFQLBP0bHII=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by IA1PR10MB6076.namprd10.prod.outlook.com (2603:10b6:208:3ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Fri, 11 Oct
 2024 16:30:14 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.8048.020; Fri, 11 Oct 2024
 16:30:14 +0000
Message-ID: <a9f6a088-7104-4a0d-8837-0d12b10d2d76@oracle.com>
Date: Fri, 11 Oct 2024 17:30:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 dtrace 2/3] fbt: revert to kprobe impl if we cannot
 find BTF for fprobe function
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241011102810.989562-1-alan.maguire@oracle.com>
 <20241011102810.989562-3-alan.maguire@oracle.com>
 <Zwk09yMWMxiwkrO0@kvh-deb-bpf.us.oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <Zwk09yMWMxiwkrO0@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0239.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::10) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|IA1PR10MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee99a24-91ed-4a0a-6a65-08dcea11fbdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mm9OVWRGZUhIek5iSVk1R3Evb3ViUyt1Q1VNY1A5YSt5UHFQalBnMVpqQUp6?=
 =?utf-8?B?RC9QbzZPZ2ZabDlrZERkSXlBdElBSElqeVkwS0Q0b2tGRVM4NExxUXl3Q2Np?=
 =?utf-8?B?a0NRT2RuejFFZkNEV0F3R3dFVzFvcHlFVGZEMjM0WDB0SE94SktMazAxQmNo?=
 =?utf-8?B?Y0o3SU44ajdqd01qUWM4ek90RXFzaEg0U09uU05oUXh6VmZUSi9ieW5DVTNN?=
 =?utf-8?B?WnNjUHIxc2pIWlk4U2lTUUo3ME5ac2gzOHFwSTEvbTl2UElDM1FmS29Pdm5o?=
 =?utf-8?B?ejk5bk5tVEIxRzFEMnU4Nmh0OWxneHpuaWxYcnptOG9kR1NKaEpUU1AwV1hY?=
 =?utf-8?B?QTVaYW9PYWVmZFRmenBVMlJ4eG9UaDZPemhUZVFVMUJqZGQyTThDM0gvd2Mz?=
 =?utf-8?B?V1d2a3ZBcTlDUGZKRGhzSVpBS0M1UlBQcEozMGlCYytMdDBSU0cvWXB3Y0hU?=
 =?utf-8?B?NlAvVVBockVDV2hsUTJVNFp3Q291VWlCbU5qamVsRE44d01ZOHVXMytQQ2V5?=
 =?utf-8?B?ZmZqaG4rRFhnUVhSZ1ZlbitrUzczc0c4RGJMdjNmUkNNY1BqUjRyT0k1YTFM?=
 =?utf-8?B?aHU1WEU2aGpVL0EzSmpVNzM0Ui9POGx5UE8zZXphak5SblRKc0Uyb3pKWUt5?=
 =?utf-8?B?dFh6eml6SERyQVBkc1FncGxvWFBHemM1WFhMSFlqRDA4OVUrKzV4OHc2WG1P?=
 =?utf-8?B?djF3U1UxMzIwMG5ieXZwMkc3OC9sa0JlSzlFSldvRmpwbzVBZjRwZmQyVXla?=
 =?utf-8?B?RUlZSmE1d0FIaklZSW5iQVZIRjk3MzBETTdnbU52K2ttaStubHVzd0ZhZUZ0?=
 =?utf-8?B?TWxwRjN6SzM5bXpkNWEvNlpOUFNMcEV0WThFTm1vbVdCNVVJb2dXTmgyN3Zo?=
 =?utf-8?B?eStzRUg3cUs0eGNYVmM5RmVkRzQ3MFJ5bms5OXUxS0lVQm5KU091c2FxOFZr?=
 =?utf-8?B?dHRXQUhVRUNVTmpFbmVhczJtd3QrVVorYThneWVlRWdkWE9SWnptSEtHOW9I?=
 =?utf-8?B?MGFSRmsvVmxVZFIwTmRsNmFZWjNiQ0xyMmo1SmgrN1VkWUp6T3VKM2Y4T2FM?=
 =?utf-8?B?S2FiMG4rYm9lYi9iVjEyd0dNMnIyNjd0YW1aQjhyQ2VEdFJYS2RrYjlNc2dH?=
 =?utf-8?B?ZUtraDVyOU5sV3JQNlVNRldkV2Nya1FhQ2QxeEs0UkVUSTNRN3NqRDJXczlP?=
 =?utf-8?B?NGdDeGtHSjd5WGlzc2xUNVZHS0pxUkdWcmlKaXg2OUYwdlJMd0wyYUZ0WTN4?=
 =?utf-8?B?YXh5aGgva0wvY0RXdkpPSG53eE9VRTV5Vm12SEZvV1p0aEdSSkFnUWtodnlx?=
 =?utf-8?B?ZUpOVytzejNtUi9qTkNodDFCT2dyM1pEOWdwcFYyZW1BQ0ZxTjhjMG5ZdUxU?=
 =?utf-8?B?VlBMcmpSTmtUcDZmLzROb2hwUUZINjJ6eElMdVZxWDJtQ2ZVSGRxcEY4cCts?=
 =?utf-8?B?RUpMbVVmYjd3aTVqM3puRVpqLzlzcGl0VFlBVG51aC9kdWhUZGZ0c3FsL2ly?=
 =?utf-8?B?Wnk1Q1RRazlFS0xEeUNZMVR6RXdTOTkvZUhzMVNNOEtBdEVEMU9LL1NmbVJt?=
 =?utf-8?B?MHFMekZaY0E3MkJQQ1diVkk3QVlEWVM5SHcyQUpNWVVuTWVYYzZrTS81d1dv?=
 =?utf-8?B?QnBSSFR1b1VEZ0lVUnhtQzlWdmJPSC9wRCtmTGVFekhVREpYRFlDWWxEbXYv?=
 =?utf-8?B?aXRsRWZoaDhadVBuSUxaRldyVVltWlRNUkVMN1FQVmRNb2k4MS81bTdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEtydTZPekszbVE3ZnNGVFZKWHBYeG5xVFNya3BKaTJ3UlZGcjMwUnZ3Y2Vr?=
 =?utf-8?B?c1FQYzNkU2l0VEVDUWJJL0ljSmw3ZUhLZVZDL3JMVk9jeFVwNldzUnRuTC8x?=
 =?utf-8?B?TDVnK2pDVHVJWVpvVStNQ0tkMStSWk9RSTdGeEo5SWJuRlFGWGlBQkVnaktn?=
 =?utf-8?B?V1drd2hFNENRRlI4Y1pETXZEL0w3Unl1QVpEOEY2YWdjaVhKQ1VGNDVLQlNs?=
 =?utf-8?B?eVpuWnJOQXdQV0VWNlUrUTVxQk91Q09vYlA2dnNhWHNPVmdVeUJjSnB3eFVI?=
 =?utf-8?B?Y3dpZkp2WndjWHA5bWx3SmRzWjBwdTU2eXVtakU1ZnFDeDdnUDgzTFJjVi90?=
 =?utf-8?B?T2NKUG5ySmo1Z21oaStrNTNzSU85cEFNS2dlQjIycnB1YmV1bXRNRVBMVVFM?=
 =?utf-8?B?OUFUd3BYYW5QYnF1cjA2ODVkMGd0QUpQUHRaRlVXSjl5UGU5a0VYV016d0VN?=
 =?utf-8?B?bGJOQTlRWEZQN3RNSzBFQm1aSnlQcFdxVnRNSTlTN1hoMG9aUlViMnBmdEhE?=
 =?utf-8?B?enBiTEQ0SzlUbUhtNFhFcjlTRCtnRW43akZtcFRyTTdmZVQ4WGgweU5LZEti?=
 =?utf-8?B?Tm9GSmJMeEpvb0tPbzVNWGZocWp1VVNxT1kxYkJSRXMzcEJTVHlZcWhRWXRl?=
 =?utf-8?B?OTBvdTM5NzJUWmYwQU9pbmhRc1RyelU3UFJWUkIvaTRJR1ZKenVtMjNWVkNh?=
 =?utf-8?B?VXA0MFZNbC80WEpMODdWVEE1MTdsQnhLTjljQTcxZEVIVU12em5taS9udnYy?=
 =?utf-8?B?YlNGdHR0cStHbnRDc1d2Q29GcDlPeEV2Mk5ldFplaHhiQkNkeXdZQndCUzk5?=
 =?utf-8?B?Wm1hMzJLdVhlUTROcGVlUHlmUU5YenhDWmpNVjdLT2tGdVRHM3FhTDFBNGRw?=
 =?utf-8?B?WUlmTTNSM3J1ZDRxSThlUXUxWTl4S1V1YlZLVUZ6aCthM2lNOUVRMHJuaEFI?=
 =?utf-8?B?N0ZFRDFMeGRwUWwvL1JGWmRGNHYrT1lDUXFHMXZGVzFucXJveEpmNlMxVDdZ?=
 =?utf-8?B?a3pSaUthTktFbkpRNlBxcEZFSW1yT1VVV2FhaWdpd20zZGpoSnhEMnlzcTdC?=
 =?utf-8?B?WXo0K25rdi80eXEvOGsxakpDL2dJV0orc0xPYkphNERnQlZNWUVuVC92ZTJr?=
 =?utf-8?B?TjcyWml4NlRoT21NM3pPQmtsQmpBeFU3dDRMcGFXQ0ljN1ZKSmI0S0h6QVlH?=
 =?utf-8?B?aFBxZ09TMGp0L0lzK3VUWjJjUVFlb1NaWWJnVnJkUlJNTzJ4eWl0Z040Zkpi?=
 =?utf-8?B?SnQyZ2c1NDVlV01BRkxwaVMySnF1VjVTWS9jeU1IcEFJZnlrSWxmVVY2RCtC?=
 =?utf-8?B?YUFSWSs1OWQvQlF6R05xN2dqU09GZUNHeThhOW4xVmNGRnBrNnFJWnpmcHFj?=
 =?utf-8?B?Zytja1k5UjM1OUpwNnozM0xmZmtLR09ncjZyN2JrUnBxdzlERm52cE1zL0NJ?=
 =?utf-8?B?eW94RDlsVGZiTTdMWjdJNnlqZWkybTRwSmdSWHJtVzZ0TmVVQTRRODlSamZa?=
 =?utf-8?B?Z29yNHlpWnQvWFdQRlJVU2phdFJmQmpOelZPZDJXTzlrQzhvU2E3UmlSQkJV?=
 =?utf-8?B?S0RwcXZ1WkN3b255M1R6K1RHVm9Dc1M3SzNtQ1FzVTZsT3U0cXcyNlFyZ1RZ?=
 =?utf-8?B?YS9qU2ZSNzZzcmY3T21EcEtkZjVQWUJoWnkwazRhWWk0UzkzQi9SNnpsSlMr?=
 =?utf-8?B?eUhEaXJmRUFmWk81NTFsWWptRDg1SG9LWDFJUm1EeUxOT21rVUFPbVZmMjg5?=
 =?utf-8?B?bWZ2VFVhUkQyZklVc2RQYzZ1TnlXTFA4ZXNORDdrY29PbkxRdmlMVkJQSlJC?=
 =?utf-8?B?UkFFdjEyQkpJcWl6ZElndXNmS09lM3NnWmt4V3pYcG4vMnZ0NjJKTFM2eThQ?=
 =?utf-8?B?RFJqMCtSbmN3UmJSTXZUb2dPRUFEUmFZU1FMRTR1U21GUVltay90N0V2ZHNK?=
 =?utf-8?B?MngvMWx4UFE2R3krc0ZaN3NTM05lb296RjdrVlcwVG5TaWJoZ2ZFb1oyWjZC?=
 =?utf-8?B?S1R1eFEvaEx1VXpnUHhjYU5qMHMrc0hRSjBJSjUwSGxrWEl6dHpCTTl0QnpZ?=
 =?utf-8?B?VGtIVHNGcUdvcWY3WjN6UFJaRUVlcDRoeUJkbDh0Q0lNTWw0NU12ZmhHK2gv?=
 =?utf-8?B?ck1zbXNZM2lNeHJiSHh3NDRTSmR2VldZQzJZTzMyY1NnenJab3EzYjBuSDZa?=
 =?utf-8?Q?FB1Fp3iSrkGwlVlErJsKtS4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pg20TlRK4YE2WknlTi61ETmQ4kMRzpjgWafUW2TMphg9nIfMDSSySiWgDEDRmerAAiifx30QjmJOJ7AEmI1reZzbj8iykyGERzBdHU6fgR5UPxIGh4Te/BZ/lor7Aby+G4CNPbDwBdomENYXUsv0wYU4C91RFs+gFDTlkI0LlGPSCvC5pXvSnzPFt51XnAN315uJ3j3OywTzKXgVFyT06qQWK04dkDSFp20lXJPF6+jdTvDa/Npfw1QXyJ7xATBsjdL/Qe9NyhUU4Y49qnp6TBAx57pbFOaJq7bI92OhP2K6faTX1p+gG+Jn0m32KaPJX+R83LY2nruJkdR9LoeR/xdZESqs/Y8gIgXFAvMzKmZx40nJ8Ams0updnCufeEDZ5mdkdfHZXGPkBRDgZyiUAmRS/vkiiYGlCIKg8o4pRNuJT7eKAINajqWnyrKyv30VIZvKyVv8Obp1zq2sm3mHHc0NBodjbDwp6EnAZqRNpZsTfwTCjHdJIEY6mWUmbE+1f/ZJo18ZfRaa6si/TP7zFGUL4HIcPmao3h0+ezOpaIImUh18BvySjlEmjm19ci6N+Yck3yhbvabPDFgJJwy1VG/u/CRxRn0HxvDfdZJ5PDU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee99a24-91ed-4a0a-6a65-08dcea11fbdf
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 16:30:14.2586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w78vU9W6IYigUOphmwp+XWD7dp7YPhjNLoFI1LUeceM+VesZEb/SGug55IJPKP9Izw88lKAJCDTECiFykHaenA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6076
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_14,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410110114
X-Proofpoint-GUID: 9Ltm-826ya7YFG6WBzL47Q5hqBc1MZlg
X-Proofpoint-ORIG-GUID: 9Ltm-826ya7YFG6WBzL47Q5hqBc1MZlg

On 11/10/2024 15:23, Kris Van Hees wrote:
> On Fri, Oct 11, 2024 at 11:28:09AM +0100, Alan Maguire wrote:
>> When using fprobes, it is possible the to-be-probed function does not
>> have a BTF representation.  If this occurs, revert to using the kprobe
>> implementation.
>>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>  libdtrace/dt_bpf.h      | 5 +++++
>>  libdtrace/dt_prov_fbt.c | 8 +++++++-
>>  2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
>> index 5716d232..dc4eb64d 100644
>> --- a/libdtrace/dt_bpf.h
>> +++ b/libdtrace/dt_bpf.h
>> @@ -32,6 +32,11 @@ extern "C" {
>>  					(dtp)->dt_bpffeatures |= (feat); \
>>  				} while (0)
>>  
>> +#define BPF_UNSET_FEATURE(dtp, feat) \
>> +				do { \
>> +					(dtp)->dt_bpffeatures ^= (feat); \
>> +				} while (0)
>> +
>>  #define DT_CONST_PRID			1
>>  #define DT_CONST_ARGC			2
>>  #define DT_CONST_STBSZ			3
>> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
>> index 0ba0fb71..15ffa137 100644
>> --- a/libdtrace/dt_prov_fbt.c
>> +++ b/libdtrace/dt_prov_fbt.c
>> @@ -232,8 +232,14 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>>  
>>  	btf_id = dt_btf_lookup_name_kind(dtp, dmp->dm_btf, desc->fun,
>>  					 BTF_KIND_FUNC);
>> -	if (btf_id <= 0)
>> +	if (btf_id <= 0) {
>> +		if (btf_id == -ENOENT) {
>> +			dt_dprintf("fbt: cannot use fprobes, reverting to kprobes\n");
>> +			BPF_UNSET_FEATURE(dtp, BPF_FEAT_FENTRY);
>> +			prp->prov->impl = &dt_fbt_kprobe;
>> +		}
> 
> This will indicate that fprobes are not supported at all, which is not what we
> want because some of the FBT probes being used moght best be served (or need to
> be served) using fprobes.  We will need to be a bit more specific than this.
> 
> Let me think about this for a little (with code digging)...  I think that we
> can do this but the granularity needs to be at the probe level.  I.e. in the
> above code, you replace the implementation of *all* FBT probes and that won't
> be ideal at all.  It might be the way we need to go (worst case scenario) if
> there are some probes that require kprobe instead of fprobe, but I hope we can
> avoid that.

Yeah, if we can do something more fine-grained than this, that would be
great. Thanks!

Alan

> 
>>  		goto done;
>> +	}
>>  
>>  	dt_tp_set_event_id(prp, btf_id);
>>  
>> -- 
>> 2.43.5
>>

