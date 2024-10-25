Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7412E79C8
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729822901; cv=fail; b=MuVga9e3OktmH18BNzh8caxeiu5TxkTEhfu4eWd2FPpqYft58h7L/IBXH1ZxSyNLCQXP2FhjPtG7hN7HOFofdbWafPg21BGRIf3kYtAlRQRDx2cpkzzwYC4gwCU0RWDa9D+OhTKziZvX4YAVIZuI8cQLBzjVP1CwjmiL2MWJLRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729822901; c=relaxed/simple;
	bh=auLFu0ThKuaKSgBzFXggcK6hmThZ9oZbIqIxlnBysXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AQ7D49ODNdBbisC5KknNk0iKFmwvE5NeKGr/d9S1AflYgy0eVF/E6JVaLSEzY3f/BFHLjkMehzFn1sr0wIyvnqNtkjmk3anFkfhRuxNeL5YYnNT0RVWv9JEtmbRWX6+2lUjSaiWEumvnUk1lYBmJDEBPtcedzRurc5cuKu2eo18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=c3B77POD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T4earkeR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="c3B77POD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T4earkeR"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OLMa6g021706;
	Fri, 25 Oct 2024 02:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=AOqoFA2h/ZrE/wv22J
	jYMJHoJSVIH+BCJgYOsCkwtS8=; b=c3B77PODCXVJdrnEXeJiUzA5+3b2ht6W4F
	7JAHweIdypduuzPbSD50jS8E08tviD6++WD1Ue3TKzWsd0uhenVJp/ySzKR8Nh7O
	S2oxvDO7rwk31N/vZry3N4hgVxNyNDsi/Vhl6QvnPCtFGd036J4hk4eYT7VGqkAX
	3EGkHXdVqQQfRqw4AJAq0nVlcZ/thG8bSUXWam+j3zGxru+olUNOklltaaUtflb/
	Gtbbiawotwhg/qtjP2kVrr+f7R287pmUevRmK6Nbd7V9j3pnOpvAqJKyqqzbImbb
	Ya75vqeHaXYlESawomhN7KxQTTtGVywdtbKiyQ/xAPF++oTJs0yw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55ekvvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:21:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P11SN0039366;
	Fri, 25 Oct 2024 02:21:34 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhda3b3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:21:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVLwl5Zx571vS7oNeJhWFNpdQz46UcHnW9at8eHQNANsJG1tpxIxH1u8tTvM3mNixF3P+vOpd2qeRu8SYIXMrP3N4pqzQC2BY4BYZrjdeOLdInFqnN5TzKq1Xuv9IOywpMErMZ6JabaiwaELJLTiLn6Z9cCiNuL9tvPALPDZrXSOrXWGzu+UdFNvJ9jNTD5yaZu7WGsn4fiaUJCC0q5p6Tnb2bMyVKIVBmqNewzAh57WhwWFlrKwmhEMMA0d0WBKcgohmimJX8iXCrw/3yPbTSKMSP0nE0aoyzrjSd03DojhhWaCuW/HK3GENI9C4dDiS6g/PP8aGNo6/wTwbGb5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOqoFA2h/ZrE/wv22JjYMJHoJSVIH+BCJgYOsCkwtS8=;
 b=UNCad+ftVJi5klbaH90PGVkVVNenbQEstilHwJCLgo52V0tprp0K5OoDKGgZ9m90UDL+QDB51yBmkiFINQ8y64OykPeglciA/L8WESlRYTqySKf9rqb5pZZksOWCib3saqmrdlY2xtQ+jmv34+jyrhpDhUd4CAZiFmZ/DGKl5phkk8lOqrJuxbA6lJPvn95mNhLp5kYzhTB21lXUkSRTK74hlyWtfoqB09xSmuIxiwjcKK/6EMimAP3ZD88wlxOnWBoC0qS/RbH6YK+THFgu7u/JLwwvnQgxcd178xoAiYrBjN5HYbbCOv06uRsWIUtEc1zp7NSk5sxPKg8qBYE5AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOqoFA2h/ZrE/wv22JjYMJHoJSVIH+BCJgYOsCkwtS8=;
 b=T4earkeRC/12ghh2KKpTlMHMUtOqrv7eOHynFxmcTWkmg8hqUKAz1g33sc3mv0WZQ/ybNQxgQ7B14FjQ2Hs03t3/FGVxRBElaYFqt1IA1xkPiUlhUgqV6FnZkYsi1EswhTouOxU0okKh1yiIqcBNIUkIIb/SL6eMWvx6eCwecUk=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BY5PR10MB4115.namprd10.prod.outlook.com (2603:10b6:a03:213::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Fri, 25 Oct
 2024 02:21:30 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:21:30 +0000
Date: Thu, 24 Oct 2024 22:21:26 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 01/14] No longer depend on libsystemd
Message-ID: <ZxsAplgn-aSrZkF2@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-2-nick.alcock@oracle.com>
X-ClientProxiedBy: BN9PR03CA0666.namprd03.prod.outlook.com
 (2603:10b6:408:10e::11) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BY5PR10MB4115:EE_
X-MS-Office365-Filtering-Correlation-Id: bd1050cd-f819-4eac-7281-08dcf49bbcde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5QqLOxeZYK2CRGiZ7IwCcdJLNdy9/rWdNzp/me2ReKT3K11YTiffqPpMrPNw?=
 =?us-ascii?Q?DMrdK+rDrUYGX5LAO95Dj03k0/Dwcmsvm1qVV+qRa1YWbyI6Ti6F2iFKY9rZ?=
 =?us-ascii?Q?SLzVSgO059pNFbi8/8K7B1lQ2nhHdTN7Ng5SkqOtr456G38epd/g0ljhDxIH?=
 =?us-ascii?Q?gkj/cvTGamufCS+cHb/7pB14H9rthwcZ1uWKP/i1uKfNSnCtPMOEAwxyaRM+?=
 =?us-ascii?Q?0idw+mhjLEzTDR9gY2V7lFf6KA3d3Dy/3Y+PLZbBYmjbbl6yecCc3J5RZzd/?=
 =?us-ascii?Q?GUeknW5FQGflq9/Tcea8A/kebVlYBkmDHwyrkwmtC6y9QKXB6lxEFuNc0DT3?=
 =?us-ascii?Q?R2CCYtSR1REBJRSUAjG8p07JU4PZDf7zbPAyf1Eaho90xR8MeOS2dDeeIuYl?=
 =?us-ascii?Q?JEv9vl3BcpikviZIvj6ytzkGgakZizxVOWJ5At/jXzPNE3OqiscQQ3RE/EtF?=
 =?us-ascii?Q?ceX2E2J8/p4emLEcjNPvAF9faIOBWOhpx8z7sWrwJ5T9hBFTYxW+B3KjHfo9?=
 =?us-ascii?Q?6M32li9vxoFwtOeRPa3PjNkLGyFRhfU04MM8h9J/hMGetZypo3jNVgdX91pp?=
 =?us-ascii?Q?krxRncJVWg5h2xUHwJ59qtQWmKHzNvGDqkY0iHnbS5WdN9afLn4nD9R5RrkG?=
 =?us-ascii?Q?X4NdeE2yN/Cu+WBoisrXjNxYP3eMj2ezvydegIZEs4VP7ovna0HRjWHrUnXr?=
 =?us-ascii?Q?8YaDfxVk1RdWTHv9PY894uM9eJSB2qwtUYLTklCPdpgZQDf1MEt7Hw0A43el?=
 =?us-ascii?Q?oQf03V7yptbxFGm7n8CD3w5dEKd8BK4Jw+eB+u90Y57EwdRJe32pejt90L3S?=
 =?us-ascii?Q?V30l2jBPqRAbA8fgSTVI3o1V4j0ZJiHx39bvKq9R1UejQCEUU5lhx3+kfk3S?=
 =?us-ascii?Q?ifvtEGxmkr+Lf34p+Zoft3rnwWCkt4HaQMjRtEGhawV5co5VPvlfG3OiVPui?=
 =?us-ascii?Q?ZF5pHSNGIz56T03KibQqezEwruVoPKqEUCJW+TfzzaN3IMNxFHysV/Y/veRL?=
 =?us-ascii?Q?UruKB1dASM9GTEksg0QeHY8x+MFuyJErQqw8OIWJAyLUW741h8OowNC+Lr2v?=
 =?us-ascii?Q?L1PfgJAG7ntwG3fnzAbno1dQcfswxT7f3oWSR4XEMbEEA8CUODf28TG/Bi0i?=
 =?us-ascii?Q?GwkJGt7Dsff1yK3F1GpuY9xKnWoJ95NmB24L/s1MXF1YU+/OFIq0IqsPF35b?=
 =?us-ascii?Q?kIPA3vtwTRvpogahZeBXopzmlUB4cXeZnQ5afzBcarg4iNjrjNmK3SV8B26X?=
 =?us-ascii?Q?AqGLK5GL21ODIkGPF+QIFdvVQNlsDjXm4T4MUOJcZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3NIPmE1B2KvoKDOEM2f0b8A/TzlhufbXrRVlw9s3L20cQ+UmL+D3o/TQTGHB?=
 =?us-ascii?Q?3VBThEG6MNPWxerDCRrT6IXZTco8O5OijLtue39i8iqjS5Qf9JOYLr4lqgY6?=
 =?us-ascii?Q?XanEhmFgX66O3dQP5KjPjzJLRwOs5d8LxFQ9V8DmoPgFd95tFEDoWOqoQSn+?=
 =?us-ascii?Q?Ro9hUqgO4GsOOtvBDD9K1zcMgFKX2PaN1oQTAvPihVkD8fpNcoOEx6sfRjzT?=
 =?us-ascii?Q?XomRe7sOR5iAUBNV9uQOcf+R595R+KSu40j6AJWyFWfeTxTtmH8Q91hJrIRw?=
 =?us-ascii?Q?24YYs4MsgctQqOtXfLJHa2d2es/3JXylY4RWf4zlMlAt1Nqyp0X0zdhmyYpe?=
 =?us-ascii?Q?Pq24DkXAz/dmGTk1afyf04Sn776rqZRBRX4i7hHOD9EDBvRgQoeguCo5kaaH?=
 =?us-ascii?Q?7Aj0JDa6MPESPtK8lgofMKdVnNcr6DXFAOExS3q5Crvc5/SNyCq6ls3DsYbY?=
 =?us-ascii?Q?5QCyuxrIyBMKHZcUjHLnYtTYRErKMgpIKX4qDEaJGejILE+UqdHSXkbTggN0?=
 =?us-ascii?Q?AqNXiyxku2/VLMcaEiZinI4sOdBP87N/ocC7Gs7nXheNiyy62LotxdNfi+xn?=
 =?us-ascii?Q?yR3gXtECfViEi89RfK6sjpl4ONyDLR5kT7of8rfwtC7tpL4O2LRakdsH50ww?=
 =?us-ascii?Q?EN5N7M9UBxwsd4IH6Xp6GZgz69KkJhNE9Qnk87qO6DSzFA/LZ8+PeinB2P78?=
 =?us-ascii?Q?/CqX76jXXeFJIiYk1T+NYSUXiXBfUwXVhFjn7Kxv9DnI6ntGfFxmXHMaxxh3?=
 =?us-ascii?Q?VDdnV85oZb2HAxFv+rWSC6TxzAtUWsIXqQXrThHd4hDmwjQyOUEgDB9Oouwv?=
 =?us-ascii?Q?x2lC7PRud3bbwyVt8Ts4NfhfzR+IyMbtu3h92KXGYsV/bQ+s4hyK44MQFtzr?=
 =?us-ascii?Q?nhGlArrH3/mk//aPDtcTXWlDOC9vuebo4Ya/b+1FnZQPUGai1/3cR0mQLxRU?=
 =?us-ascii?Q?yxn8HaK/OtpwUOVFPeKPAtAdrky4YQ17fWoInn+U5D3j8G2JSUEdNEkXXex/?=
 =?us-ascii?Q?l8/irV54p4c7cfDWHN7ePEBkhh9oT4eAaIO65sJ4wZKbTB1zpJhaFa11zpf6?=
 =?us-ascii?Q?rGEGUu0my76gPLA6oOcbvTWxRZmmj77EY8IcBZ52Y3wzWu+fMkHiVFMqB45v?=
 =?us-ascii?Q?/c1ZsdWcgYef0tsK49DoXbizXL+lpWDsN2/kR8vLphfuKDHTmLCuogoDJ86h?=
 =?us-ascii?Q?3KBCNRfQeLnIlZ3lIIVE8mIZGzAIunaz+1gkzEBM2e6kyhRRTBtYpuGJmmI7?=
 =?us-ascii?Q?OZBkv6cJbTrA9FXI1H2QuXtwFLeVLS/lvmDCunDHC3TAmJjd+32LUTuLWTD2?=
 =?us-ascii?Q?6Sk5yFgW6SrIU0zQlaYUQhXNucknW3qG2/jafr8dkU26nP3kxbE0xemg5N/5?=
 =?us-ascii?Q?e5yz5733PrAj2d/0bN16A96PgBsQwUjAyGFJhtY+TYVl+KAmA++n9v3Gbnlw?=
 =?us-ascii?Q?qR7kgeTeCoMReZMEjffAKOaLNQwCCJMRCRx8Ufma0PCO1RPIwr4tf+nQRoET?=
 =?us-ascii?Q?RkD4yq6aQ0twvoDEQmatbAHxnAeLZajfGpZKtpaZO4Oe/1EUKMl8wAUmHvdq?=
 =?us-ascii?Q?1Q24ARq68d8LA/3mZ+pvQAX997tn01gnM5FIKdn1U6CV1/VUiji6ZMOTTKgO?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	45LEslOo54Czbcz/sXyDFa7oVhuN/JnpA8OT1KuJa2FD0BeeI1KfKBu5JHiLkZRyC9gzFRKlVwk0PVgXAbHIF7mxb5T4mMuXe70xSKOwCgW7vjw5zn/9sQ/+HbVUlFdIH0eeCmtCWqBoEG3kuPG4YQgGrS78ULE7xNbASJwSJQF8fcrN1RXa8BBW+nyTKKjSTk/wq2FfyRc3KrY5gs+Y4wx0HmNXrdKesA/RAvcPeUShDkNkz6M7cNCbHQoM4g8okqWEJgYlq+YMw5pt3oI+eok5RzZq2Sh30YBFD0IuxZv98BcecdNN0V6H8fAFn/MBbGwFoYxe4U8F9QxI9wVY9z/Txar5gsKTqUP3o3vzvj4otXZFBKGpcrp2847CyCxstqBAgVGVBrrMb26fqSkVDbDvdavQUDw+2r6CfUlgjZbsDWIAsSTxdWak4So/bn2KcNN0a9ROMdbaLDeEyYRggv4eGfvdyvAwjDxylcJrdkBgeK9Tky9MF8xtuvB8voCmsQEEJsEzV6CcR54tovqCrcCrRhH29SdDN2iP6nTKar9vFQ3EKqg5BJaAaiyRBwQGlEyf6P+LgzEqjo8aQjs//fGKQXZGuKlq75t1t+v0i48=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1050cd-f819-4eac-7281-08dcf49bbcde
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:21:30.6997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EWYnRi4Htmn3QxOtgiINmyjF77zC9Mg/J9Gu3hVS8MCOJhcT9xdQWtEQ6YDZOKej07MH++dyXavwgQyb1Z955mvx/cesgIlk8cFuG2Zud8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4115
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_01,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250017
X-Proofpoint-ORIG-GUID: rhmxK5rjk9EzzMsz5YYbx8itMpmfWBjJ
X-Proofpoint-GUID: rhmxK5rjk9EzzMsz5YYbx8itMpmfWBjJ

On Thu, Oct 24, 2024 at 12:37:45PM +0100, Nick Alcock wrote:
> We only need this for the systemd notification protocol, and that's so
> simple there is MIT-0-licensed reusable code in the sd_notify manpage
> showing you how to use it.  That code looks pretty much OK, so I modified it
> lightly and pulled it into libport, with one tweak to remove the use of
> __attribute__((cleanup)) (it could be replaced by one line of perfectly
> trivial standard C code, saving five or six lines in all).
> 
> With libsystemd linkage gone, we need another way for the user to indicate
> that systemd is not in use and the systemd unit files are not wanted: so
> introduce a new --without-systemd (and corresponding --with-systemd=no,
> etc) in configure.  (Someone directly running make can just pass
> WITH_SYSTEMD= to make.)
> 
> We lose one feature of libsystemd's sd_notify: we no longer remove the
> NOTIFY_SOCKET env var from the environment, so our children could in theory
> pretend to be us and notify systemd on our behalf.  Since our only child
> is in a seccomped jail and is part of dtprobed anyway, this loss of
> functionality is purely theoretical.
> 
> Bug: https://github.com/oracle/dtrace-utils/issues/92
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  GNUmakefile              |  1 +
>  Makeconfig               |  1 -
>  configure                |  8 +++--
>  dtprobed/Build           |  7 +---
>  dtprobed/dtprobed.c      |  8 +----
>  include/port.h           |  1 +
>  libport/Build            |  4 +--
>  libport/systemd_notify.c | 70 ++++++++++++++++++++++++++++++++++++++++
>  8 files changed, 82 insertions(+), 18 deletions(-)
>  create mode 100644 libport/systemd_notify.c
> 
> diff --git a/GNUmakefile b/GNUmakefile
> index e7657d466df5..99960227bcba 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -102,6 +102,7 @@ PKGCONFIGDIR = $(prefix)/share/pkgconfig
>  INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
>  TESTDIR = $(LIBDIR)/dtrace/testsuite
>  INSTTESTDIR = $(DESTDIR)$(TESTDIR)
> +WITH_SYSTEMD = true

Why not: WITH_SYSTEMD = y

(since everything else seems to use = y)

>  TARGETS =
>  
>  DTRACE ?= $(objdir)/dtrace
> diff --git a/Makeconfig b/Makeconfig
> index f3d47c086f4a..346078598624 100644
> --- a/Makeconfig
> +++ b/Makeconfig
> @@ -218,7 +218,6 @@ $(eval $(call check-symbol-rule,ELF_GETSHDRSTRNDX,elf_getshdrstrndx,elf))
>  $(eval $(call check-symbol-rule,LIBCTF,ctf_open,ctf,t))
>  $(eval $(call check-symbol-rule,STRRSTR,strrstr,c))
>  $(eval $(call check-symbol-rule,PTHREAD_ATFORK,pthread_atfork,c))
> -$(eval $(call check-symbol-rule,LIBSYSTEMD,sd_notify,systemd,t))
>  ifndef WANTS_LIBFUSE2
>  $(eval $(call check-symbol-rule,FUSE_LOG,fuse_set_log_func,fuse3))
>  $(eval $(call check-symbol-rule,LIBFUSE3,fuse_session_receive_buf,fuse3,t))
> diff --git a/configure b/configure
> index 4026a3eafcd3..42e496b97a7d 100755
> --- a/configure
> +++ b/configure
> @@ -93,9 +93,13 @@ built locally, none of these should be needed):
>  
>  EOF
>  	make help-overrides-header help-overrides-option
> +	cat >&2 <<'EOF'
> +--with-systemd=[yes/no]		Disable installation of the systemd unit files

This makes no sense to me.  How would '--with-systemd' mean that installation
of the systemd unit files is to be disabled?  Surely that is not the correct
description?  Maybe something like: "Enable or disable ..." or
"Specify whether ..."?

> +EOF
>          echo >&2
>          make help-overrides
>  	cat >&2 <<'EOF'
> +
>  Options controlling the compiler (pass on the command line):
>  
>  CC				C compiler (may be a cross-compiler)
> @@ -153,12 +157,12 @@ for option in "$@"; do
>          --kernel-obj-dir=*) write_make_var KERNELOBJDIR "$option";;
>          --kernel-src-suffix=*) write_make_var KERNELSRCNAME "$option";;
>          --kernel-obj-suffix=*) write_make_var KERNELBLDNAME "$option";;
> +        --with-systemd|--with-systemd=yes) write_make_var WITH_SYSTEMD "true";;

"true" -> "y"

> +        --with-systemd=no|--without-systemd) write_make_var WITH_SYSTEMD "";;
>          HAVE_ELF_GETSHDRSTRNDX=*) write_config_var ELF_GETSHDRSTRNDX "$option";;
>          --with-libctf=*) write_config_var LIBCTF "$option";;
>          HAVE_LIBCTF=*) write_config_var LIBCTF "$option";;
>          HAVE_STRRSTR=*) write_config_var STRRSTR "$option";;
> -        --with-libsystemd=*) write_config_var LIBSYSTEMD "$option";;
> -        HAVE_LIBSYSTEMD=*) write_config_var LIBSYSTEMD "$option";;
>          HAVE_FUSE_LOG=*) write_config_var FUSE_LOG "$option";;
>          --with-libfuse3=*) write_config_var LIBFUSE3 "$option";;
>          HAVE_LIBFUSE3=*) write_config_var LIBFUSE3 "$option";;
> diff --git a/dtprobed/Build b/dtprobed/Build
> index 9132c3e31c8a..346cd6aee190 100644
> --- a/dtprobed/Build
> +++ b/dtprobed/Build
> @@ -29,11 +29,6 @@ dtprobed_DEPS := libproc.a libcommon.a libport.a
>  dtprobed_SOURCES := dtprobed.c dof_stash.c seccomp-assistance.c
>  dtprobed_LIBSOURCES := libproc libcommon
>  
> -ifdef HAVE_LIBSYSTEMD
> -dtprobed_CFLAGS += $(shell pkg-config --cflags libsystemd)
> -dtprobed_LIBS += $(shell pkg-config --libs libsystemd)
> -endif
> -
>  ifndef HAVE_FUSE_LOG
>  dtprobed_SOURCES += rpl_fuse_log.c
>  endif
> @@ -43,7 +38,7 @@ seccomp-assistance.c_CFLAGS := -fno-lto
>  endif
>  
>  install-dtprobed-autostart::
> -ifdef HAVE_LIBSYSTEMD
> +ifneq ($(WITH_SYSTEMD),)
>  	mkdir -p $(INSTSYSTEMDUNITDIR) $(INSTSYSTEMDPRESETDIR)
>  	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtprobed.service)
>  	sed 's,@SBINDIR@,$(SBINDIR),' < $(dtprobed_DIR)dtprobed.service.in > $(INSTSYSTEMDUNITDIR)/dtprobed.service
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index fdcdee14f851..c83f0adb56c4 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -61,10 +61,6 @@
>  
>  #include <dtrace/ioctl.h>
>  
> -#ifdef HAVE_LIBSYSTEMD
> -#include <systemd/sd-daemon.h>
> -#endif
> -
>  #include <dt_list.h>
>  #include "dof_parser.h"
>  #include "dof_stash.h"
> @@ -1073,9 +1069,7 @@ main(int argc, char *argv[])
>  		sync_fd = -1;
>  	}
>  
> -#ifdef HAVE_LIBSYSTEMD
> -	sd_notify(1, "READY=1");
> -#endif
> +	systemd_notify("READY=1");
>  
>  	ret = loop();
>  
> diff --git a/include/port.h b/include/port.h
> index 427129000b4f..6ce8611e9025 100644
> --- a/include/port.h
> +++ b/include/port.h
> @@ -29,6 +29,7 @@ int p_online(int cpun);
>  #define MUTEX_HELD(x)	((x)->__data.__count == 0)
>  
>  int daemonize(int close_fds);
> +int systemd_notify(const char *message);
>  
>  _dt_noreturn_ void daemon_perr(int fd, const char *err, int err_no);
>  _dt_printflike_(2, 3) void daemon_log(int fd, const char *fmt, ...);
> diff --git a/libport/Build b/libport/Build
> index 48ed99e2b017..822049f5e547 100644
> --- a/libport/Build
> +++ b/libport/Build
> @@ -1,5 +1,5 @@
>  # Oracle Linux DTrace.
> -# Copyright (c) 2011, 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -8,7 +8,7 @@ LIBS += libport
>  
>  libport_TARGET = libport
>  libport_DIR := $(current-dir)
> -libport_SOURCES = gmatch.c linux_version_code.c strlcat.c strlcpy.c p_online.c time.c daemonize.c
> +libport_SOURCES = gmatch.c linux_version_code.c strlcat.c strlcpy.c p_online.c time.c daemonize.c systemd_notify.c
>  ifndef HAVE_CLOSE_RANGE
>  libport_SOURCES += close_range.c
>  endif
> diff --git a/libport/systemd_notify.c b/libport/systemd_notify.c
> new file mode 100644
> index 000000000000..f78bca6e14c5
> --- /dev/null
> +++ b/libport/systemd_notify.c
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: MIT-0 */
> +/* Lightly modified from the sd_notify manpage.  */
> +
> +#include <sys/socket.h>
> +#include <sys/un.h>
> +#include <errno.h>
> +#include <stdlib.h>
> +#include <stddef.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +int
> +systemd_notify(const char *message)
> +{
> +	union sockaddr_union {
> +		struct sockaddr sa;
> +		struct sockaddr_un sun;
> +	} socket_addr = {
> +		.sun.sun_family = AF_UNIX,
> +	};
> +
> +	size_t path_length, message_length;
> +	int fd = -1;
> +	const char *socket_path;
> +
> +	/* Verify the argument first */
> +	if (!message)
> +		return -EINVAL;
> +
> +	message_length = strlen(message);
> +	if (message_length == 0)
> +		return -EINVAL;
> +
> +	/* If the variable is not set, the protocol is a noop */
> +	socket_path = getenv("NOTIFY_SOCKET");
> +	if (!socket_path)
> +		return 0; /* Not set? Nothing to do */
> +
> +	/* Only AF_UNIX is supported, with path or abstract sockets */
> +	if (socket_path[0] != '/' && socket_path[0] != '@')
> +		return -EAFNOSUPPORT;
> +
> +	path_length = strlen(socket_path);
> +	/* Ensure there is room for NUL byte */
> +	if (path_length >= sizeof(socket_addr.sun.sun_path))
> +		return -E2BIG;
> +
> +	memcpy(socket_addr.sun.sun_path, socket_path, path_length);
> +
> +	/* Support for abstract socket */
> +	if (socket_addr.sun.sun_path[0] == '@')
> +		socket_addr.sun.sun_path[0] = 0;
> +
> +	fd = socket(AF_UNIX, SOCK_DGRAM|SOCK_CLOEXEC, 0);
> +	if (fd < 0)
> +		return -errno;
> +
> +	if (connect(fd, &socket_addr.sa, offsetof(struct sockaddr_un, sun_path) + path_length) != 0) {
> +		close(fd);
> +		return -errno;
> +	}
> +
> +	ssize_t written = write(fd, message, message_length);
> +	if (written != (ssize_t) message_length) {
> +		close(fd);
> +		return written < 0 ? -errno : -EPROTO;
> +	}
> +
> +	return 1; /* Notified! */
> +}
> -- 
> 2.46.0.278.g36e3a12567
> 
