Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B230C288C08
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769457969; cv=fail; b=e69Fi0F1PkF0f/2rfUiJ98sR5sj3SAsAORnWGI5xc606CwppCxLLeXRx434vozE5GoYtunr4KXvInTFWS1OZmctQGr5w7pxn+45LrjkMqoN+7VwQnoNpgLuHv0JbhBZO2BwSkLeplTqv4w1Efa0AaX6lJcLkxGo+UGE7j+R9nXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769457969; c=relaxed/simple;
	bh=Hiqf89Mgt+s1sNrWFwSA/ne95J0/lUR/7ia95oAPa38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lSPkUxsQiOKyJIwpaTG40uEDYpzGq/n3UsG7PDqteQpVAbqkUFCrMGG39zX2llOuTjcM+93NtUP4bfhO+IpCr26NrlnGZd1T+ndlhuunbGwC3fW6sH0M51hO90s6VfIysnpN/ac8hTyorW7+Kyx5QwjVMzU+yVUUWsZtXqjFseU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bpEDPTvw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PJ9DAn2/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bpEDPTvw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PJ9DAn2/"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QGelNx3979642
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 20:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=h2mrcOwGr2Gl8qDzT2
	09nLJxZeSzDt018eyG9/s1jck=; b=bpEDPTvwKAQkKt8Yj0SJqz+obdPsOEBT/8
	qKfcWkrIotwAnyshXZMf2PVTkfypGbiiGfHZKTWV+LdnA8DkbX6AptW9wM2LypQP
	fOzzFiu80OLGC4gh3FS8m2669B8VUoGEmvklOZw2u/jFFSpNmSxEn9HvMb7ev9t6
	eHEkZhbhpnG8rEIu+RTP7CMgBUjagVGEEXouF+u87sLuQtGzMMzIzX77zvbzQQil
	WWME9M6kaHgCV3jWVE5ONj77ov7o8TMPUaG7TaQ+uN7yuD9JUwSacWnxUDfbW75H
	1AscvOT/ijPXYh2R6s9diQxuYcNmfRrILQm93IeU5NscOjMT6EWg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvpmrarya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 20:06:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60QJa6Jj012232
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 20:06:06 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh8enxw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 20:06:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyL2FFE7utHhHpbqY1r61NmmmGFYhYrQR8jti7USzG5hiXuC9SSEZpuFMhiUT+/2E8IbhmhcpKeJCafDPXfrStQ9SkQAnYfTYSZySbUV6i2DQB8DIMd2S2Kl9HW4oGmymiorwAVBGNjXZni2lvkyTy4jXgfyKfKpsLszkiGJx4Bqx6g56B3miDEPsjEFtnOdFZcjmWMRgBqWy2dXiNI5ub0+DjqYxeYnqU/aA/gVHMVg05BbKBaC6QhcQ606MVD/vLvKStIpTm0EAAxH7xHez4q9xKdF9fAwn34ee6wYEaydjV3rSEiKdFS4+Df5ikdLGYq9be36B8kQ3V3MxUc2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2mrcOwGr2Gl8qDzT209nLJxZeSzDt018eyG9/s1jck=;
 b=j2vhUXRasp367ovjFEdpOXQa2D7yaDQ+9cSv8+ZpZKZFOgCeXtjl49SpjrugYGvaxtK/sGL8VKuaaRS047eGsKyGljNjRaTtlDkXwx9DtSSQhfM/Z8q7voS64rWXreIx2dYoUt/9zmwDOwpfgsmRWEbhPePlFJFuM9Yc839r5uiP57k+TscBZ49CDcNAlTEvYJHiH1KiYxrbwdyYLNOFsi0JTzQAqThrD73BdTK7zRH6IWLk5G1NfCoD3LPzdJdQbqpbp+nnAb65lGO7OQl/KkXH99B7g7LylTGDa+gyk/L/xN+uRWTETZLe1rDjP+6XZ29En7/b2Tui5FDWfwIiXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2mrcOwGr2Gl8qDzT209nLJxZeSzDt018eyG9/s1jck=;
 b=PJ9DAn2/yn9Ei79SdirIo8HBbt22SJxanKTEowmbemITpy8gZQHW6mallnFI8mpwTtFYOj+qP7H54QPPR2lj0GRTHGgOWa9ObOKE2I6ekvXmIrwKasl5hV2BSpaIJSvOf/fLSw1OgHt9DmePhvN7cWThuZGwsJfyAUUQM5O2L5k=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by IA4PR10MB8254.namprd10.prod.outlook.com (2603:10b6:208:568::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 20:06:00 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 20:06:00 +0000
Date: Mon, 26 Jan 2026 15:05:57 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Add llm directory to installed doc directory
Message-ID: <aXfJJVU58IaTbOQv@oracle.com>
References: <20260126193920.16930-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126193920.16930-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|IA4PR10MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 4adc967c-0453-4270-6dcb-08de5d165319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qVScl0A66ehuOdsVUy7SYGQLLt7chlaQV2S8y0ubdRBrQGtsPj/QE3QJ8vOJ?=
 =?us-ascii?Q?iLFlKqLKzbnLK8oDoxNh17DTYR47i/v7m61TR0GaF/SfcusjaJ8NFR5TdCHq?=
 =?us-ascii?Q?WvVCCkF+v0U1URDX93V/zJply/UEtt67lVe4VI/M0v6Ex/0e2nlxMCJCOrSm?=
 =?us-ascii?Q?KNigR4tvugpUhdiGgVvzcIUkiC2ldXkDIB1yzpfXs8lTZBpC/W0tg8sefVTz?=
 =?us-ascii?Q?uBdMIYno2MUPdyAI8Ie98xp2fNO/oX5OO1N2ZrDgxH53IbWkf61fWFKdWGVw?=
 =?us-ascii?Q?FIqxBJwisQ/77sFLEShHJQNgHxO037QMG8PrwCOoG28ZYG/Di9mKnXD35d4X?=
 =?us-ascii?Q?CnORN4NGDBJJXY71eKveN2zn459UYnzLXPA5x4lJsHtEohshfKI7zED/HJXz?=
 =?us-ascii?Q?bAxT06Z0+daH2duA3V02zAWrC9MLAtGj+RzeRoKZA8OqnaWQJkfxCbOdJFEJ?=
 =?us-ascii?Q?KkKBjJCVkdKpF7XuThUyMt0qMGk/9yjBlnYOyApJ/15Q2D6QX21WPLl6XVxP?=
 =?us-ascii?Q?ADrtLbKzV3+QCxy7/ob2jKnNBujWmrK18mXcXhQGzWaG99j0VhVyOcTpxpyZ?=
 =?us-ascii?Q?2Wyka19fABPFntoAmBKkGogTTBqxKfxMHo+1RrOkLgBAsfDGbXvGtterl0hi?=
 =?us-ascii?Q?zNEk/Hii0Q9vIZBh96biZ8MSD9CeGGHllrGDeqllonNP1HXdS8UxLctcFT9H?=
 =?us-ascii?Q?Jk8LfMOpeeGlzRpyrHZcR45Hw4v5Kew4AGK2wctymx4tpnpITJ8+hqAWpE4O?=
 =?us-ascii?Q?doWTdQ/1PrStrSb28Xn8hsAiHA64whzwIGwFZ7LVLECkSHZn/6Rgj85e/+l7?=
 =?us-ascii?Q?0/91ozEil77aTWbmvLGvkpT9g7VgDr25ome4x6EdIz1Hh7mQYjTiWE/MJUCA?=
 =?us-ascii?Q?vxQ2Tm6ucxAiklgJvC/xh1dhsE0EslNA/TJrltx0j6LOjSs3jW5yOBGndHa7?=
 =?us-ascii?Q?pw2xioYH9xMrKBGHOVTW2Rncvb0JeyUfiCAJSFfieHekzpff3500p0xbhfkA?=
 =?us-ascii?Q?NCl/i+e4MWkOYPZj39YnkqQMMczF/6qRfT8q+bxyP1Nwk9+7nkfi+tceZ9EQ?=
 =?us-ascii?Q?IFCu9T4CIFwOg+uMssaA7/1AAkTDNjmZ/rgmUK+/AinpvNEj2Bd5GcSBp7Kn?=
 =?us-ascii?Q?0zVSz1EmD0dh/wCHBS/HU+AmoT7/VMWPkxLN6OaK26paZZpde3tvxRAKfhbT?=
 =?us-ascii?Q?exbRC39+qI08RahDuwC+28hJuttjxHzwJAbSsUPxS/jgly0NUyFALl8rHywC?=
 =?us-ascii?Q?sDLa7TeU/KApuRYr4xXFfjfWK1X9qI5pXndirZKDReCx6+Ppy0Zr6J+aWo3m?=
 =?us-ascii?Q?C9OJmw72woaQ8eVlct7T+eK3fjKYKHT8s6mtfydgtYevcYuYPksR8CcOe7Zf?=
 =?us-ascii?Q?jm74IoSai4xxhjtLSaSvEpdwYxYUZFUrX1VYmuMa4AJVeAM1XFQkQ75XNtqA?=
 =?us-ascii?Q?DCPy3TcfLMFEkjJqkATK/EMAFfUVES2enDJNVaqnTBeoi9D3xFPIuukv38fZ?=
 =?us-ascii?Q?LomZRXbQnWqX25fWOc23SW6TkrwO8ampCoyIOIkCH+ijPWrSpYiz/38r/HD0?=
 =?us-ascii?Q?yGtnTyX2xbQ63xelPEA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rD3knyT1l1D2RrxI6ZuApxyy5bLB+RpRn2+8fcr28XGV4cvcZO7ziiBOVjgv?=
 =?us-ascii?Q?B41fegxRWL9MEpRy2NFMte/s0bC/ZLRejwJHUrd7+5gAJny49uuX31HHOrBO?=
 =?us-ascii?Q?QHsIeWLPvbSVqONtuwMgSnwv+BfnGoTJL1wUD8MnDOkOPwsKtlKqEtF31bQu?=
 =?us-ascii?Q?LbnGffyMQtE7z7kxxDYZjAQJApzy1/dlMUvnzkhN1gn7IxFkj3v2bIrQX3GB?=
 =?us-ascii?Q?rRa+0Krh0Uk22A+5RWyrarjHffSlFsGKE6LMdIQpGccyhfe+T9dD2q4nTNdB?=
 =?us-ascii?Q?0WAGCFrM46bKwMRY4kqBOMLifu/YcBEOFMJF+pPYnRI+BM4onn/U1lFH+0To?=
 =?us-ascii?Q?Z96N2ivyqdIVd1Yf+XHbz7clbqYJFLIIkJz7AtEo3SzYneMZYH+lhM7JC1pR?=
 =?us-ascii?Q?dfFXC5VX+SssKqgWtsQvtDFlz9lXQjsWauhjIBh3d0C4IVSlXllnnNDqOx06?=
 =?us-ascii?Q?c8moOL4om2Hc59frWtx0ow6nvuhPra1QUJNNxSSa7wo/btIZ69ntN+7WSg2R?=
 =?us-ascii?Q?ea96wCqNsU19nsS4duiA4p1L+toEv+cwHXtXy836chOYdtHAfRlYeauOHQLs?=
 =?us-ascii?Q?B0bYqnBkEf+gfm1/BoOyWpZmqJELqI9xAVbpANRsLmXM0MRYMCqSzf3uvUkT?=
 =?us-ascii?Q?8pIexEMyhlAGYDa+NvRoiAtKPChpVnZSWols+ACX9yL7ISR5rYQ05E1oP1Ci?=
 =?us-ascii?Q?1PNOuSYbqyXRBlGSRKpM4cggLGw0Cc4l7bG/NDAteRasGqd9PHQPMQukVWt+?=
 =?us-ascii?Q?WR5ntMLzEcnj8f4qpTJykff8yqF+M1Lbw6XRwhgYSnF9nO6K2yHVVYAmflcq?=
 =?us-ascii?Q?7Lckkih9S/+G6jyoS7j01MQ2+Y3PbqtMdwX0QK7vHi4IthGTcAtsQNRfXrYK?=
 =?us-ascii?Q?X1rEvbU0X+KBx06gTZD+vCkBnmJQesB00IPbiQoEC9b13m4u2aNlPQY321V9?=
 =?us-ascii?Q?sFo4tZ+psNkKrt2VT3s4r53JdQ54gKcj16VM+hKZNk1tioVNiBDLlTiFyN41?=
 =?us-ascii?Q?bfzhqzaIm4cXEF/OQCadRgBvspWTaayYEes+sPRhkI5keFYmwVsxuG+CG16J?=
 =?us-ascii?Q?/WFNMJXXlY1Ibvdy3QG/pb7lq3pDvGPapHBCUKCx55cpd85+htsGav0Vx/vN?=
 =?us-ascii?Q?q2XIJ67hvxD44Td15lhEFnWNSqnQ+ww5UqKQ4U/ODMc2VLgZ1I6wK0fybsGR?=
 =?us-ascii?Q?sOTvdqoRvUQ6VcFJq4lj2TdruT5RGT5SfIB32//0snCGYgdJvPOMBfC35uJ+?=
 =?us-ascii?Q?91PExJlweeDRX5LxDb3qkvfQ0R8Kmkk/n7iriSgMFBTNywH4Xd0c9XEg7pr2?=
 =?us-ascii?Q?TN4RyqKEOBcWe0c5bORZT955cMGuHeV+gcDQ6dFYfEWtz6rlQ8/+tHtDOZ9Y?=
 =?us-ascii?Q?DZVTU8lxZXvepEk/T6PFyd4QPA0H8EDwLvnZV1TGTvbFqiZK6vv0JIDBqRX8?=
 =?us-ascii?Q?yFxLq1HS724lIvCeNOFgpS6PKRoHUa2P76YMsgdJP+e5O499Srs5H60UeN79?=
 =?us-ascii?Q?qFoN1nrVsFxxleh1DoIr2hw1wZTa94FS9ztam5t1aYnEx5QaNagbyIAI0bnq?=
 =?us-ascii?Q?JuaEiA8q0NN9tP40pkfwxRLXwd0t6g0aqpwnYnISfvqiDZ0co/6u9DhXRlv6?=
 =?us-ascii?Q?n6qn7VYzadjTdTXXLVE70hBMHMB97M8yWPCPqoWpbgT17LnZuEefiJuXoNpf?=
 =?us-ascii?Q?vNH8/u7msuJhCjN2WW7nY5HutIWMoPZIOiM1aBsoDflgHKCC18+txdY8h6GF?=
 =?us-ascii?Q?Sga+X3SSHA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yVgdJHABzrAajAqoXBJMZryKdtQovUPZHa+/aaVpnM0GCVBTTm32YbaCFWs8FHcMU7j4ik48LtzmRgNZAIJz+2i25Asj0FrSxMaf8aNyxjtjt/PUp7dCFkVovMhyGtQLxjgD1MJ+ByHxrMQj4GhS7VvKIJYywC3dwl4CKL4QMcRZX7UvTHayTYoV5V8l2lVrq9Z5c8mMY+aTsDATJdv7HGQfcsTFEA4BA0n8QfNg0lDp9Kx+KT50skcaqZpXIbdrRSVpGP+eQfVXAeqkaZMjJ3Gf5ZKLFYhghTTMsmh1fU1gIBNgm4j0YmGrkc9CYy60bFLqrnsQFKezjkYgHG2uIPK2hMMm8S1xa+pfP/pSQhy2ynp9/GAd1ImvS15Znzi9QjVmz9UE9IHBQyfN4qMgH/ST4nRKQvkllC5dtF9kyeOtSs8LrDhSgzaSB8GbvIPoB30lrB59wvcpEJBiAK262vZevse7xUnRUuzjmq5BqpxK/gKY/fcs/0NAOM6AEETE6J9Tdbmnp9GRAZh8HHUM9Odvq1jh5BScM4Js2k9Ymu+Mr1dbKvM9Hrfc6q26zzvLzN0YBwTd65sZ5+V0Th/2xGPxJ8gHuY/DWME2zhL/VE0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adc967c-0453-4270-6dcb-08de5d165319
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 20:06:00.7757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APmQkIY04Q8BPQVRKcMH9o58AP6Rpn4VYqxE5MB45Ef+735pPhYM/O8cti3SuSEzuzZyWMkHsCnELPBhqk0ilPK0GJjDuKhLwdLrw7NWE2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8254
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601260171
X-Authority-Analysis: v=2.4 cv=Q//fIo2a c=1 sm=1 tr=0 ts=6977c92e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=eYetjBgwXZnHJFChRLgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 1Gfsa-XN-VWF1BkapnQQHotWzuKZcjfY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE3MiBTYWx0ZWRfXwaz7eTLeSSoZ
 QA1/pwZpjo6VDpYxb5XHaFuKe+elPfFvY12SLM1yqg9GaKFhk3Q2TXHW87DscpDk4p4gb00J62/
 nHvRQJbNUJaekFgtFkh8VmWurJblTs9BG7M68/1+LbVxFk35MT6xtJZjJ7r/LT/WeK6p3cYzKx3
 rsHPOTHGHOsEs5hYyMqqGM9T+y1MGNbFHlvkrWi5daLMWdjYRBqrE95s066ryNWQTYGyo0kGhqX
 4amy2Yde1sefP0Q37gCty90+o1vRiIlbrMkz0Y3S7aJ5zXx1W/+kwVwnj/zVYFUwS0DnQeUwJuv
 C8zQaDt1pqfOGgnbZTEwQblM/Io94eMQ8zmqJY5iw5q5iZmapyGTYQ8aCkeyrRPsh/n0Ohb3Ku6
 82Z3kKCOIb4IA2BRHB5Lfi+F17amq36jVYvHxFCp89jkfQl4qtwkaZABQEgfj1+myjuJF81ZhgU
 hZJbKdaiTdHMI2mKaCw==
X-Proofpoint-GUID: 1Gfsa-XN-VWF1BkapnQQHotWzuKZcjfY

On Mon, Jan 26, 2026 at 02:39:20PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... although it seems to me that we should be doing this (and the install of
the other doc files) from a doc/Build file rather than from the toplevel Build
file.

> ---
>  Build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Build b/Build
> index 434f8ad92..cb8db08a3 100644
> --- a/Build
> +++ b/Build
> @@ -10,7 +10,8 @@ install::
>  	mkdir -p $(INSTDOCDIR)/userguide/reference
>  	mkdir -p $(INSTDOCDIR)/examples/
>  	mkdir -p $(INSTDOCDIR)/examples/language_features
> -	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS tutorial userguide examples)
> +	mkdir -p $(INSTDOCDIR)/llm
> +	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS tutorial userguide examples llm)
>  	install -m 644 README INCOMPATIBILITIES NEWS $(INSTDOCDIR)
>  	install -m 644 doc/tutorial/*.md $(INSTDOCDIR)/tutorial
>  	install -m 644 doc/userguide/index.md $(INSTDOCDIR)/userguide
> @@ -20,6 +21,7 @@ install::
>  	install -m 755 examples/*.d $(INSTDOCDIR)/examples
>  	install -m 644 examples/README.md $(INSTDOCDIR)/examples
>  	install -m 755 examples/language_features/* $(INSTDOCDIR)/examples/language_features
> +	install -m 644 llm/* $(INSTDOCDIR)/llm
>  
>  
>  install-test::
> -- 
> 2.47.3
> 
