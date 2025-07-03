Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58B225A338
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 18:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567190; cv=fail; b=gUKuJrFmuofuBBmAHkPmBRHpFwjOM6l/1nT1Omb9Ob3cWP+gzOx4FdNY2nw1GXFjkzv0nV0PdJJtWB5rpyNQhpIburUAbFzDpV9IPTvLcyL1OVNipKploH5SW/YZdc1qMSX4cAV9ebGuQCBu21z0E//InSoHCwhCYCw/kEmi6R0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567190; c=relaxed/simple;
	bh=m00nQJ55iz6hFxTngb8G3E6SNC1f/1jK6aOlhGR+0kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OTlrjCtUhIHr2qS9uw6AhdJtbu4igxzCqQkavhHOHsz+hqFRl+FiJNz8avg4Dftwj3538kCoAV2S5oF0++M5k56iyNTuWWyGXmEOgHWvSCXWs+UFUCZ8hDMxZ8NMbxTRhFPdwzhTQGkcibJr4dMYFAscyNsxj45uWT78LzlNqAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L/qofkfA; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nX5Fn/Ss reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L/qofkfA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nX5Fn/Ss"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HZ59n027843
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 18:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=eJCuqZubyIaRHFWPaJx0P6vmRhiBGuwpWc3Be7DO+MU=; b=
	L/qofkfA/RGMTPYjBJLIk31+usoPqmUU8lPbWMudqFhXGoi3sbPZpnNWAWJUxqFD
	I6N1/BsOXPACVVWnUQOAsK2Dr5PisO2gWx+zLyd/qbjtRlEGAKrlTc5wjFFZjUzm
	b1hiZle3rsf9OTsh457gh7VNaE/pzha8QhFGN98yGW5FPH4EVgpV31ryGNfsklwf
	5gPJodLlR8jBoS/LO2sBuKvdmZV1ES+bhELc2nA+BP+RDWUE4jRGekV/xUIU3xPy
	ka9AgW+fe0olCkpkbyhVksyFtcvMT+zW82R+Tp7JUhC8ooVUS9j9OdjndjW9UjmR
	/GM01I75ST0zFa7ce2kqUA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx9jaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 18:26:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563H3xSb024776
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 18:26:26 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ud1k6x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 18:26:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quExUUZ9FBPHQxzNE9hpxYn/hEMejWdBX7pJrSFJuSZUyTANPEZZOXhiDmbp3jvL9CZkgKAlYjTpncNj8YXnLC/+NQVsrjJQU/PoBDt8EWvcFJBfuI53+TYZKUbLTS9SQ1BAOzhazhq0aKWJymoqcA6R0UCTQNIYSTrGS9/2TO7+Duw3r7VvrfSNH0icMbI1G+yKAJeB/Nc8K+LWLfOwHd5FSI2AqlXZ4J9rW6PI8NhgHBS2EbTAYHz5KgJ6V526g3v55171LBcp7gop/Z3XtdRlbl9aBiFo3S0BOFmNjagle93UVDmPaV+X1fwqBkc3P9WLYTVP2eTozOnIKFt4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pu6Xd/FGnCBaLlmCiffWdTn25FWJOMgJI+LZ4oQzjE=;
 b=kVGKZlPKDME/kiiEyFfestKdhFI7oZb4y/ggvdVKR6e6vFaPF9jHx6moU8ebVCz2ZpUFXX87K40+3zc11d1XxHmZxT8GjNmTq1PEO4dFSVcApSbrUKkIVkUOXCpStU+XwjicIJIz2sHILse+yzBf74VA28lLGjBYrDaDFmv/LSNuwJ1Mjz8Zes6iJgUioEmZ9Nx8CFe3hVkVo4mwRBas1Kq9xMLC8EHlY7yxBQtCiR4yX6S4NK8NfLteHjZ+nQs718WH6cxdxyX08wEWXWTc9YIfX5LQglCHGdEnaD40SUsnDAeCIz0iQ+Vp7iEmO9MHTrHmM7mAroxbfanzjX1z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pu6Xd/FGnCBaLlmCiffWdTn25FWJOMgJI+LZ4oQzjE=;
 b=nX5Fn/SsNG3oNyK0fGr7LEVA9J15i2EyvzBVGtyQqNaxSuiLtcSdisKLvV24JBV+SkwSYqy6z3Oysb0nMv5ITFfA15p7yx6kDP0yMzEewOzy37efO8/KgIE2YHD+cCnu5qldybyttmj8ZRd5+uty018YUggKAUNjfFHzj9bQ85A=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA1PR10MB5687.namprd10.prod.outlook.com (2603:10b6:806:23f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Thu, 3 Jul
 2025 18:26:24 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 18:26:24 +0000
Date: Thu, 3 Jul 2025 14:26:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
Message-ID: <aGbLTOzqILN+3J93@oracle.com>
References: <20250703113345.1273604-1-alan.maguire@oracle.com>
 <e660b225-4a3c-209f-fae4-8831f6c3229c@oracle.com>
 <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
 <afbb9858-e5a7-6d76-a6c2-23b46d8660df@oracle.com>
 <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA1PR10MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: fe68843b-4ea9-4e62-17ca-08ddba5f1dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?1a36cqMCpNUSYtLkOqlOxB6g8V4vcoa4oFPJyauxwfVMMRA+x4uu3+Gdh/?=
 =?iso-8859-1?Q?VGEhF0vwUBr3rvmknAopWFbWLkYKg/OUAY1hpW+1U56rO6bnrkzmrcbMnC?=
 =?iso-8859-1?Q?GeHZnYheR+GubyWQijfCfvIOBJcePSYvmYC/RNnAB8VeTfXBJMBXXzxhdc?=
 =?iso-8859-1?Q?vN0KqN1DJJz8NoaxSzORFVSNECANOV+vsd95X67B/cR6cUhENj/25vqndK?=
 =?iso-8859-1?Q?1Yg5mPDxK6JDLhL/lcC2uy93Zr2wzUStba1EqKX4W09uufdIRGh1uBHlHl?=
 =?iso-8859-1?Q?kfukn/1aEbdELXUi8DN2mbF7wYNNWucIRRyrLfXi3rDPzCyAQPlVhuPLed?=
 =?iso-8859-1?Q?9b9Xx0MPpDACqaITjh/5Dw7ZUUwgl7JVfNjejgTwciVyPr20g6mWrbEQYT?=
 =?iso-8859-1?Q?CxDRajiElQTYEEgds8F8WieeXq5KB9ikdO9bW/OyQEvy3NoUnGNnHtNht1?=
 =?iso-8859-1?Q?6ekKVS2iQ/BPBxQGwhOpvbnEuIFnnd4BJRhCcYW3H0EqYZK5UE+/pSLw1D?=
 =?iso-8859-1?Q?M/0ki0WLtJVs6dsuz6lnN6DvhIfF02pZOrf8pWFtcsC8SYfculULH6yZfy?=
 =?iso-8859-1?Q?OW+v6sRkoUgt8jPo0LHjdfY9h3+Qo6ZIpG2KmQCeNbdobTvV6fE/R2uPWh?=
 =?iso-8859-1?Q?n0XFwBYnfpNFVpeXQdjFAL76v7mM71IJKlvQ9Cl3HyKTi3VepZLdrREdav?=
 =?iso-8859-1?Q?qh+ArwjKtPXvQWJS47YWGzy+JBIiXaojhvVC7bg9j36WOEx2/re7VS+tS2?=
 =?iso-8859-1?Q?4hmUCE2eWfuzt+zl6EeUaP+jhO52qJ6nFqI73b93IPHpRKeBXBcRDpyq8V?=
 =?iso-8859-1?Q?2ob7C91AdYkIpIjImD0Nr61PK6buc4xM7+xsVJe4oysc0OqeCODA9N3XiD?=
 =?iso-8859-1?Q?YiQswYU7zG9Xk8XPynqVu2dr4qtdI7T4fLQuKEFHvvWWxpxUxl/vLp2eOv?=
 =?iso-8859-1?Q?GByU5K0XwN9vdnJGIcSV8TA3qoH3nAZnQj5nIK/DfSvmJTMNDjF2HqJCi7?=
 =?iso-8859-1?Q?4jUE8YlxbZYa330QqMqiCEANht7kdJolkMxljEeqt09caH9RvMSnOanCPV?=
 =?iso-8859-1?Q?pgQy/GPKPzzFlYHY8vaEC7mpR1tNmsrk381EATQPf7YtfM+3ru9zJay0hd?=
 =?iso-8859-1?Q?OY+xJF9vC6IcmvPXUzgLN/xqpPpZPdXDGHbdrUzBTSnESQLQdte9z6n1wu?=
 =?iso-8859-1?Q?lGi0F1uSFf1ZiN/0dmz/tfXBYJYR/1pE1MoTWWSHLlhiJx016QfqTutbB8?=
 =?iso-8859-1?Q?unXYCCuONEOssHlfg3Gq65l51z3f6IkkjFw4fcZOGjbRn8H1QYaJvYWmjg?=
 =?iso-8859-1?Q?iTo1F8Pzh78B4Bz+SBm7HbjIqIaGwDaXDhHRhuk49CcNnLNaq7e8yPk6X0?=
 =?iso-8859-1?Q?SdPjl3gd0n+ai5I0OpOB84PUn0SBEClaHc/ekfZbcPVlIZFcIioVtwhRWb?=
 =?iso-8859-1?Q?Mg9IeTP+vSqZCyqczF7sd4XPjQS7tHB/PYmQwqLZJx8e+pVPc/wNyBiV0f?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?czFEyA6h7LiqayaDyONpjOl1sy4UElYdBOlF39+V7BulzaMJghrYjUHudD?=
 =?iso-8859-1?Q?HIImx3noVEKz+OIh4GH6RBr+vyj3dwc1fe3ParfzUCVt+VYZkIjPfcDgzO?=
 =?iso-8859-1?Q?g9wyghOC8t7wIV0tg8TJGJa2cUau6otRQekmtHyUrmZQcy4JZm9Dp2TAHq?=
 =?iso-8859-1?Q?GwLAB7oyeJ3R/MUjMPzl89PwEg59xgXQrOW0qdDtCUX1jTkjHuup9Mwasz?=
 =?iso-8859-1?Q?RGKBxq7vIniyGId+vQMVr4bqmGLHAZZRZrXpqsTihXKyAmn288GzZTgwB9?=
 =?iso-8859-1?Q?3WBOmfEs10xxTQY0xvBrrBMIr4TseTbxwp+/8HppJcnw1yJz1+ryiB5neA?=
 =?iso-8859-1?Q?TyE7IfQ2zZvhfIEXEPVrpsaJ+4dDlYf/fCAB3nIFhgUVCArpIC3lEt4jG0?=
 =?iso-8859-1?Q?ZgpLT1YNTobQyRm+Tzn8yxZPp/I3vagfwKvfjvMzAjyYn6YLKkHrb8tXoI?=
 =?iso-8859-1?Q?HK8zsCELk/9/GYgrotIHUcR6LJpc2FgGVf7RDV9JbQftkS/YsoLFwFLmHs?=
 =?iso-8859-1?Q?18Q+aWneJzq0HWpLaVP7r+/5cAqb2XSTRRdpwsHYnmOhsjDqdRk4gu9EC/?=
 =?iso-8859-1?Q?Ow3MChEPGCVafJAApJpBXpZfsCH9X/EooxrZ9YGBwMA0Yxu2ez3GiWmN6Q?=
 =?iso-8859-1?Q?xgAm0uB5un4MpS1yJZVSoZpB+nrWFW0L8aAs+NKJ95sakTLGRap44Ct2aM?=
 =?iso-8859-1?Q?Dc8It2POXnI/mDwku2+KHrU/dIMJQLY3lu5uRO+0QuY1OWDJD+1mjH1H2h?=
 =?iso-8859-1?Q?vgAalfriCbxwu9YwB9DLxvgvVuBERWc8lOO4ukoHjaQUV5bctk/K9HzN3R?=
 =?iso-8859-1?Q?bmYhxboDKhktfB3R59Se55mHMUJBbSJVjSWIx4Y9/a1bTNGFe1ZlNt6zIY?=
 =?iso-8859-1?Q?lDDDvKkP/SCpmciBAQInI/R2yxEfzBdw20ck0QyhFPqPL5yceyHstNttE8?=
 =?iso-8859-1?Q?0z5iovvmEGwFuAt9+4JZNtiy9JHhyGq9HQaazFqtCkwIGr2zsukmMtQ7L5?=
 =?iso-8859-1?Q?iT/YONQ/njoMjhoViEUkA7ylD6atdB+i54sVMxFNSOYDA6VvUZ73Yt3sso?=
 =?iso-8859-1?Q?9lV9ISuBrpP+gGJuoofIi9qYVjWbw/lkwF680JDwFgHQiNRLbWIgTWKtgA?=
 =?iso-8859-1?Q?O9yhBrT7wkt3nv05g6GIJA245dFdVUOEzFcemQMFbueQRl8wu8thwJ31fT?=
 =?iso-8859-1?Q?36JtL/TeRbPDjLBDFECimQK9ER30neOzEovcMFE4Y3bZUf+HcBEpPRvbZn?=
 =?iso-8859-1?Q?MZkhYW9Klnm8v3Gn5/wafduGimL0p8oFDVVb9g31R/6pS7UxazDaNKftNu?=
 =?iso-8859-1?Q?keN+Wis4z2Dnqn+fNnKQgaIUreB4ANQZIecC+VF6D25WaVanKo6gzScalZ?=
 =?iso-8859-1?Q?VOlbmH7EJhoOvPgJlB3ubJQyp3hrj98IxcptM5NBRmebYWK9ZZmpoMjMda?=
 =?iso-8859-1?Q?iTQCw0uOgvccUvhNjUBdHw2toSaScEFALLKcyOIsknE8lGyGTNqmScz1LT?=
 =?iso-8859-1?Q?N7m5oxIVX5xMBrl01jdmeSMtcxxXRae34ur8a2ZA/mZj4dKJy9+pN2tFLo?=
 =?iso-8859-1?Q?sU7g5BfKCs6myXP3f9iqdbILJGq6mvx4k2VbkwJN4bMFjrdE0PNbCulKyA?=
 =?iso-8859-1?Q?+cO0m4qMEXX/HLtM4zfEIw866ikVwQdJD0oOkeeV/huNjZwDEym/HSQA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BC6xlIjNdOilHwPFbcTXN413hdXRlhN1RwiP8c9yFSSHY2Zye9qFxeuQUStxjn61W+IE2yc4CCEfSkhSaqUgFAaplRU5IZBcyazy3OrG2fbB9tCuKkBsmez+CXCF8n0ZBfr0K97lGgbU3eS3tFrIpba3COqliTlJr5eyttesNMNuN4UF4bS3t7aN3md9gRfKHlCndRY4QeV063ImcJpUO62vJOEia3fwRuSKUGtcbfCYBx3fLrQSzaewo9kcXWa15IovhiPbVfmDzP3rc/3IcBj5Tbt9VQD2r4wNGvW9wP+IqdQfXaMm7bUd4y0x/52DjZZou2hpodf7vTtZusoWKd/EIbNJMZjmgj8yqwgFXjywIIFvps3M/12uQQFQptM/9JUAggZYIfucuv9DqVUTKZD+gAGkrA3vSXZ1HJpsTAxCBbYGdsYINwcawfKkiKeRufMJpJu6UrO8yQNR9CIYRl62xKVxpcXVQRVYIHwY6NV3gWZw7gJh8ZHIh5UhMDF4um0TcI+pUzLYhaQpJIScZRPHg8vq93gaj7Kj65I/wRmuKIrf/NdVXbdn6wrE9smBWbV/KlencrRGWsoVmhFFckbh1JjAOtc+hAiI6XgoIEY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe68843b-4ea9-4e62-17ca-08ddba5f1dd2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:26:24.2320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zVGkloCySpE4u0Kp00IbEoiF/MHd8aqejmSTzAqO+HPP1B/M+NebBJoQNeGUHUCGSdvRV8hXqixqaQA3BMUnDuM+KfCjscegi7isQItNeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5687
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030153
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE1MyBTYWx0ZWRfX+DvF3k449EVF QbY9FmCtB5pOKsCddLs4BNQV1Sa3I9G5rwEP0UpCbfCPQ59jpjr4rno8cy9PhXyRo4IAHCE3vdO L2iLXE9ClctUgMYsM4mnZy8p6zioQA+eQ9gJy87V86AKjrZVKmJpCOEJ+zjfvJ6mUj1eRK2Eq3p
 C3vVE+NGlYJPIRl1BMCcNFqnaILh7A9ejFCOQ59qPzsBCq0G+HN+Z4/SLT84SLFki8gctA7NhZG 8gHIpZwdCSiqMgadXuBysr3hE7coF9IO0kRMexLhy9OI9gS/LI9d0qRDrCbhKqLOML5YoVCXtRi llNYEBb/5XyipHWQaffoDgbgOyMARfP2taC5UsnzI66U+MKyfmEBzliqd2j/7iiT8hRvtSWqOpE
 BcqUP9kUMMhJi5/PTE0ntCnqL3XZMfWeHakw61lL6ZzxQoHN4RyOaF5nY00EFpwzd0MOGZGa
X-Proofpoint-ORIG-GUID: 3s55G16vHtnlKGMuagQAfv2oUJPiDG1B
X-Proofpoint-GUID: 3s55G16vHtnlKGMuagQAfv2oUJPiDG1B
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=6866cb53 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=QiM2UoEePj4o_oVQQXgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13565

On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
> On 03/07/2025 18:06, Eugene Loh wrote:
> > On 7/3/25 12:59, Alan Maguire wrote:
> > 
> >> On 03/07/2025 17:43, Eugene Loh wrote:
> >>
> >>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
> >>> patch 3/4 feedback).
> >>>
> >> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
> >> send probes?
> > 
> >     dtrace: failed to compile script /dev/stdin:
> >     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
> > inet_ntoa arg#1 (ipaddr_t *):
> >     Unknown type name
> >
> 
> Ah, sorry yep I have a fix for that one in the next round. Basically we
> need to add it to the core set of typedefs and add a type for a pointer
> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.

Why can't we rely on the pragma?  That is how e.g. the ip provider manages
this I believe?

I'd really rather not add a type like this to the core set of typedefs we
can avoid it, because it really isn't a core type.

> >>> On 7/3/25 07:33, Alan Maguire via DTrace-devel wrote:
> >>>
> >>>> The current approach of looking for remote addresses
> >>>> is brittle and fails in many environments; it checks the
> >>>> default route gateway and looks for open ports in the TCP
> >>>> case.
> >>>>
> >>>> We can however achieve the same goal reliably by creating
> >>>> a network namespace on the system and configuring either
> >>>> IPv4 or IPv6 addresses on the namespaced and local veth
> >>>> interfaces that support communication between namespaces.
> >>>> If a tcp port is required start sshd to listen on that port.
> >>> Maybe a comma after "required"?
> >>>
> >> yep, will fix.
> >>
> >>>> Teardown is managed in runtest.sh as signal handling for
> >>>> timeouts within the test scripts is not working; a trap
> >>>> function does not trigger for TERM.
> >>> I'm having trouble parsing the text before the semicolon.  I think I
> >>> understand it, but cannot seem to figure out the grammar.
> >> I'll try and rephrase; basically I tried adding a
> >>
> >> trap cleanup TERM
> >>
> >> to the test script to catch a SIGTERM when the test timed out;
> >> unfortunately this didn't trigger when tests timed out so we were left
> >> with network namespaces hanging around.
> >>
> >> How about
> >>
> >> Teardown of network namespaces is managed in the toplevel runtest.sh to
> >> ensure that network namespaces are removed after test completion for all
> >> cases; success, failure and timeout.
> > 
> > Great.  Or how about a colon instead of semicolon?
> 
> Sure!
