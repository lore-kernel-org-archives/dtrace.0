Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D542E284B
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 18:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754938508; cv=fail; b=Zrft3o1TQNWcT+EiMMBuDJMqqV9FplKu6c+Pf/sQWIk/5ChYpkzZzY3Ps2M51BirT85AU35+s+ou7KMhgrCDtRj3d14wFKBx/i1C9reHfzz4FcWQAuM2FrTXZGaTtW6sYUqnH0JWXmDOEGCZ8PkrtNlBpWlmbKMfo089Gy6osVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754938508; c=relaxed/simple;
	bh=3SL7GWEG+Am4/mpEE252u37it6++O4tV/u64JodR1Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j74CjNZg3ryMB2Q9uSfdc1IjaRyycijBbDT87ezq06iLeFrsdjDNvXAeDOa9/SR8UhjHcsT8B9NjZNKdBegVxyUCJm3MzLXyx6qITXXDwQGnjnrMc622EtTbJ+2KZLtXoK4za6D4R/7InuoraVwYzNsDwQHIWr196ZrByHof4n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GRMpUYKl; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tswjv+fG reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GRMpUYKl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tswjv+fG"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFN5gI006321
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 18:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=34D3CrMZux5I1XalizDahVf6o53hg0CnhssJ3Qt4fxM=; b=
	GRMpUYKlLxXjrhbxsQlGXNxWcSyBQpHnY7jkiCUoCT2UNCtXSkcnj+UyJzjZDPjK
	/TLXRCruqh3NFVZbbIejbZ5TW5PXn1DbDI3pccoHmbp+ImdnhZYX1vtlcRQKkikg
	9rDCHdIyJvtMrYiopHyzDLRHVcOoOAmKfXz2qdnduBsIDXnz/17aXagWFwv11xcA
	RDzkvyD1eATqs9mQhhC5POuTNxJPb/lZOQqrYfyVWARNpPxUn/8BJEDps5vkxgQa
	WF4otPHdG42OBOvVjuYJMgcVKlip1O4qOw61y7yICnpLCua7qUipc13+H5Z+yG7/
	+jJAQlF7xHpWkTrv9f+vlA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw8eb8xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 18:55:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57BIJw3g017466
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 18:55:05 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvs90uqs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 18:55:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUpReVsCbbFalm3y42kXgu8xB0EvLBGGSu9HhEvZEcRms7LpE+HNC9XzJSfn6rUudRgTuvJPmJ5FYVHHLhcLbnkgdDm9tI14kzLTIvd3hnHolS7fTU6c+ESYie8HEzSHMTBt/qXBHGWHAh8Apsgsd2HdgIEE1FRpBIlYIDq1/Y7nPs0+htp0rTFplCgb16ZPoZ7upkcwny9MWbCm7UJKlTQL52yaOJO/6TKoluxB5fyxuOxqLC7WroWLVBtsRb9KxWj+PBTBSVhsVkaybGsM1kc2l+l47Ng5VQMap9hwJuyIdZXcNbiiqpH1dGtyQ13P5lj3SPDDctflQ3sANumw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xytN/tUkQxj7nNf51YgLcyk49k4K0ueXFT8hkg0sU6I=;
 b=LHv8+1oOKQVEq5jthT2LYcGt63n6ZSmVvwq8oPGWafFE8Bb1M28gXWdUjHeORcGaabyhRF9ZZxCHkYSvS+Ruu26PHmNqL59crUnQ15ZhZ9OrXCzczB6RO76LyUUZdQcYu9O/+pCVZ1VzPkDAYSkUkP3LtKPIAi7yRX44n2G/HJd1l49E+aJoujb0N2te1BzKEBe9MuSMQvXnqlP91fqOXdIf+9mfAwWo4VHnZWL7SfWT271J4T+utREim8Pn9Y3sCqId0XNS35PpBRWk7Im4+wQhIQ1d+390+wEigYD5YnZEKsFaE2SpLLnujthwLyPAoFVPS3/HeeOP/NitbBV+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xytN/tUkQxj7nNf51YgLcyk49k4K0ueXFT8hkg0sU6I=;
 b=tswjv+fGy5+lOa6EOuzehYoTItbsOVw/Q/6c3w4xNWyf6mCeMF68dBAd38ssGWwqZ4bDM3XxDxs/XkpBz85DA1PLodTDAcH81+XAUwswdxlbKnkx/kZ+A1v3Mirev8ssegK4SdwavEGLYgp0C7HFgs6YK1bCjkv20wGogMgZ7Us=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ0PR10MB7691.namprd10.prod.outlook.com (2603:10b6:a03:51a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 18:55:00 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 18:55:00 +0000
Date: Mon, 11 Aug 2025 14:54:57 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] dvar: ensure dynamic variables cannot
 overwrite eachother
Message-ID: <aJo8geFjJE85IGwy@oracle.com>
References: <SJ0PR10MB56723A6CF8353F944176679DC228A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <b74bfdd8-e6ca-c67e-2e5c-3ce77e7f5af8@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b74bfdd8-e6ca-c67e-2e5c-3ce77e7f5af8@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ0PR10MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b51447-934f-4f9f-6ec7-08ddd90892bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?7s7ALqTbZIvjB7gZYbDw6xCS16tkIJRTio81Frc9HcnJbFDwiFcsqCzTSW?=
 =?iso-8859-1?Q?ie+j3CRq6gxDxG78rkSqzcIHZswVKLhpsKIF4y42pf/P03ijB3MRFR6+F8?=
 =?iso-8859-1?Q?2XsVik3gzk3Hg5Bb32b/hBIHt0QSs+2sBoyzVtqV+i/qHkHS6FMqCS83Eb?=
 =?iso-8859-1?Q?COccvJ4eS8R/u5JS8mOrlLIwHAWUfjUsGRXbMFVi+ld7SXdjkMqq+SLEGN?=
 =?iso-8859-1?Q?mh1tOwc8ku0mhlURFvqIHpHAK/MCTSUqeK2hSQ0TFkrQ/ah5ZiWpeXkP+6?=
 =?iso-8859-1?Q?6zpgmWWr2NIsWLxiHwo8uoVRoSWXYZkdA/QxxFnxfRNl6aofS2JIn/C7/d?=
 =?iso-8859-1?Q?s26D3Etnmmx1Q3kUAym3KUqZ0O/cnLNszkB4Xx+co7GNOPXriIg/r/mfK6?=
 =?iso-8859-1?Q?Dw9xvXnBSPzuoPI+Qc77tL43nR0KB1qrJHXDoKWAEcnia5mnIlX1974M1z?=
 =?iso-8859-1?Q?f4IvqD2TK3K0XPVBn2fCFZNgcqpV/xB1u4ruH/mpaejkv+Ynmu+KWPld9g?=
 =?iso-8859-1?Q?gII8g4gS+qTGToey3aDj+ctbtZXWlKlk8vF1Ih5hApSlCtikd3intUWdpO?=
 =?iso-8859-1?Q?8I5Diu29FJkfwHYXKuoH9K3vXma71lhgc3LplZStzdPWjtDz6MUbCtJ7na?=
 =?iso-8859-1?Q?ejVoPWEvxCJgQ/1FW4JnEuAQGX3N2ehH0UrygFsyA+1UIVJKAA8+5Gg8Cp?=
 =?iso-8859-1?Q?MgrpHexWr50hxFOBCikSSpLK9t0Hrs+GwZflgiLolitGqa6JDiNCkdx+Nv?=
 =?iso-8859-1?Q?k7ZzEJQj1UBVVVgMIAeTCAu7pErc1JcJRBp7LV/Y3zBwsD/+nULvtk/WIt?=
 =?iso-8859-1?Q?mhmfKp28dgPPh2B/GBdVd3h5RifuYoAzPkCVYuY8ENFoUy+Wri2AnhYWiu?=
 =?iso-8859-1?Q?V8TCp+NO/K/6ipuhYhh/Mz06eoXK5bHXJrc72D2mi1sGFLXRCskXSKvVcw?=
 =?iso-8859-1?Q?Xojq6HU2OEt3kmdh1s3oXBP9sHgmPT1vclGesyIhgIof/AnjKk6Skx+wI1?=
 =?iso-8859-1?Q?W5/gOV/xzyCNGv7pSonKlX9/d72nNPoJ5mdzh38w315YW3IiiUidsyipmg?=
 =?iso-8859-1?Q?oHpnDPjaeD7o9cW9wf/9Vgpm3BZAQ2N8TJMe5lw4wl1xtzihgvCsSff1es?=
 =?iso-8859-1?Q?c7PXaKUn0XuLXjxTa2TphBZkSnQKJ6VklmlfaVhVIUppvwM5PVZ8yjREaH?=
 =?iso-8859-1?Q?TLEHDR3iO96qN5yah/w8vhn/60oK9tnWMBt+THkPVEqBSSlJskZAocZmnY?=
 =?iso-8859-1?Q?vzV8kll0SjyFvyMQqT3kI9jDqHvvX/KCF5V/67yVIhT+BhsYoArdS3gv6n?=
 =?iso-8859-1?Q?gFshJeERPQxI41GPQKAMeZXLZWOQAtck9M6VpkNh15qp38CPYKKKaYdXZj?=
 =?iso-8859-1?Q?RfWi6YJ/LppmQ52xxDlRE5x/YDkH2Oja7lbUQYsKcPlBLZTqmbNnLzadlZ?=
 =?iso-8859-1?Q?ag/Ofp90YPVOK4pYS/oRNeWGO3xHyln6srOGCQYXBIOj/k3VPDXOjtT3my?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?cBCuiwoxmh8H2Y46ODL360REAdlQ74ve2q60whSUTCFb3CVmiNVzkcXI8h?=
 =?iso-8859-1?Q?jb14uVz+M/zZ8BANtgPHwCSUummgeMck+Ojz8Ap8J/pK0lq6O4uT7Boo3o?=
 =?iso-8859-1?Q?3R87e5ppwdlQErvdW7803+SdN9456QU//JUw1+jLSUpI+/+ir3tFbWfVrV?=
 =?iso-8859-1?Q?jXmnP8lF42LEbFWWbaN5VYRhIOh9sBtdr4WbY20HWaSi4AEeVUjdNfSzL+?=
 =?iso-8859-1?Q?KM+drxt9Ser9u4vnG9aR+lpZcIXiS1+JjI+aBXO/PGQXkVlw299ssmBNhH?=
 =?iso-8859-1?Q?Eo2VkrlB0ArsXVyg3lsfVnvlMBat3Afhz9Z7FuKby9XAMcI9y1rY2IZglz?=
 =?iso-8859-1?Q?U/ANCmjo8tUkGyMzazC+6gAQs0rChZ2Pi5r2q2FulzaXLQfEqLgvVVsaWb?=
 =?iso-8859-1?Q?ul0QRQhxBSJS97PxMiHRhxdL6DzXvWHnqt5BDxU1O9Uifa8/9fwiBoxEk8?=
 =?iso-8859-1?Q?2eMvdAMD7b4GGF3ciHhfEnT+i9AsxBcrJdpXuxm1ARDvE6J0HE6iJI/ExW?=
 =?iso-8859-1?Q?g3rqx/DBg17FxXHqY33eLHgtz2XOu+YbWqBL/4wRjSRcJR35IPxi88dmgx?=
 =?iso-8859-1?Q?FfrwquR4I7OIegxQFxfITWo+5mFb2WYzz/89w+gdSKobbSbkXow+dKulgp?=
 =?iso-8859-1?Q?5X2kjKCU9rznfNBBuL+XRqWCFZ/flMGoPhnEGfkvQ3W5XKAbuVC3wfS3tZ?=
 =?iso-8859-1?Q?9bo6/17hZGjt0ynfXFPHmRk7lcRpYzqJMJxYSbUP59RZ97Y6UOtKgtfV8y?=
 =?iso-8859-1?Q?idx1BiJQdaiWGpT8CXgHNaeM7p5Bo3d4LQN+hzl8c3PUizZjnYxY5Llo7E?=
 =?iso-8859-1?Q?D1On5Efic2fgH68Jryzdz/tzrFw6WRy87SECX0/mumuHUOn4pvfVY27eTN?=
 =?iso-8859-1?Q?oa72/JSdt98c3ETP4+FoauEXxuHcUtdLiNep98FoIz4Mhz0QrzfzLK++aT?=
 =?iso-8859-1?Q?N7DIflgXIeqZekde/AiYCKfCn81780EIZtpDTGdySQhlkJhNnlsdIMPdUb?=
 =?iso-8859-1?Q?UenAT37NivTsBpDcTwNshreJaSxKC5vv2corlBwa/e+14P9gQqJ10WSEet?=
 =?iso-8859-1?Q?S+Hh40Qwf8Z04TT2t88YNMoXZfE8B/YPpADdZacH5+yhPCGbBereatXi6h?=
 =?iso-8859-1?Q?nsx5Go6bbSpM+ujL7CiRVOk/wnHhXRwuc5OD64qiHKrEqBw47/9pIi3o7B?=
 =?iso-8859-1?Q?wMATk2Ko4AsROJdfOrIMnQHeGig66xFYg80ycnapFL+4te0/mZyBy4gtb3?=
 =?iso-8859-1?Q?vqYukWJFST5UagI1a/S6W/iDifbhjbe40cz1XdnA+FGsStLO3/Qlo7ryPv?=
 =?iso-8859-1?Q?wQfDxQBXXIgaLvbldXTlheLVuBuyowgzvZLq9NsZUdvFZECgkf37toY9H3?=
 =?iso-8859-1?Q?ekLgWKTYOX8Mbbo86L6ckr1jp12nC8PUuU0VRti8r5YOxGSP6Wslr3mNI6?=
 =?iso-8859-1?Q?xYh0QYgMWRfInIwJuhM4TwvnXv9sxRHbFVDkZB2ukIhDYXC5NjO1rAxnYz?=
 =?iso-8859-1?Q?DBrMQBFc5rHFOvGLk0RqyX5JWXOfvs87CDr0EH4hXaHAJfLNurciV+uzq1?=
 =?iso-8859-1?Q?gImeYMfGbTFkInwv9UDGHX1FyGWIhD2dDHsdESkQr/wUryK0iwNq+2+68L?=
 =?iso-8859-1?Q?GcV/teW0Lp1hsTarwwq2RfKWOnLvAUIBhb4EuCcNbtpoeXH0RGBxFlcg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rIYDia3zFSk8fpGU+mrJqePrTIVSaXCHeYu55QOylhyU/Zdl6vrr6lJk2VdtedjdfhwRmIVu1OMHEvWZPTizDEkhmL4qB4xCxxiTK2WjFK2dkAlIURHb3MPoiHc2sgK/Ph6Gu2q00WSb0zSd+Fn6D9xTP5wz4nvou1fgKFFWm397nd/i3Dtb0x2W3O3F6FZOcjzvJVS7CLSS+UXQfg1qc8Tj0i3WeIAZrHAISidUM8WfupamYqdSNwSjnsx5Q0emHugWRFz32/LI+vtN0juSv464vUQLMkO9woxLuL+dHl7ghzklYU33cPKnvWppFYCY3O3rDJDgZCF+ZyiRIanaF990Iy3JoKkc84LVPyNiW0/0Bp+DMXrbaRBVjth9mIZ65u0i+OFMfZKW/0ZAADp3I54Hzq2YxPKSB59SfZEJqYoNZ7ZcaBrhMyugLYmXGZKiu8ZVD7mwgZVUJBZoxHbOkxWXCjmi4pZ7gYvhxzYxd3BVZWSmo3oG1NyaUzQaEfrpG45cTMuiE0+XL4iDhNUfdirg8vWuftSxmM99H34Ja1/JTdt5tiaDxcN14HZdkINTAetauDwyZYlee6/ZKWL+mZrJcP+jK74/Sqh07AE7nXg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b51447-934f-4f9f-6ec7-08ddd90892bb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 18:55:00.3438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNs+xR//9TohLle/DUyY5IeUUMgEGqU/piGQF0bBOShZvDEKFF2McnhYzUo6DuIeJJzo0921qeS0DekYfHTVWnYhig6xQq8RaCnhgiKT0hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB7691
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508110125
X-Proofpoint-GUID: 6uFKNKXbvyqamGvLhYrnfs_owboVLtuk
X-Proofpoint-ORIG-GUID: 6uFKNKXbvyqamGvLhYrnfs_owboVLtuk
X-Authority-Analysis: v=2.4 cv=ePQTjGp1 c=1 sm=1 tr=0 ts=689a3c89 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=QPEOmcv7ST6u2VrtyyAA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEyNCBTYWx0ZWRfX1eVpPJmVmXtG
 lbPnCyOhVjFa9mq+qbd9N4XrKT/SEwJcejsIKS6LNSNf2YRM9TpXT6aj5kby0qTiPAlb0astRKQ
 N+cjoxOjxb8zhDuspNDsRLEVgzYXcK2/VtBRZ86Bd/deYSPstiYhdxA3SAVSvGXpby7tKx5pav2
 1hlqQzIuxgOTZEFtTgu0+KjqF5yBIJRl90jlNjgafQLAFah+uEtP1SD3qA3siqVujeqRnqRW19n
 QKkvW5BKpoHMzEBp9saBrum5qTpB5BXFXXDfHk5xri0LPP44w1cXsx/o1J414lqlOZ7w9AiOYno
 JpzSHbAq1yhl+fw1NRs14mQh7h+a51pDiyrlBm75Oxf0t+uSy5DLT9yq7MKNXhwWmdPRUIYGGKO
 oO6WlK7739Q135qqyT+87BCKRx0p6h3n9OtnzxDY4f3FaClAGr+wxNex9HjfX+P5XW53bWkC

On Mon, Aug 11, 2025 at 02:47:36PM -0400, Eugene Loh wrote:
> Wow:  nasty bug, nice trouble-shooting, simple fix.
> 
> A few comments below on the test.
> 
> On 8/11/25 12:24, Kris Van Hees via DTrace-devel wrote:
> > As Eugene discovered, it was possible for dynamic variables (elements
> > of associative arrays and TLS variables) to overwrite eachother.  The
> > problem turns out to be due ot the implementation of the BPF helper
> 
> s/ot/to/

Thanks.  Fixed.

> > bpf_map_update_elem().  In order for the update to be seen as an atomic
> > operation, it does not update the balue of the map element in-place but
> 
> s/balue/value/

Thanks.  Fixed.

> > instead allocates a new element and places it in front of the old one
> > before it removes the old one.  The result is that the address of the
> > map element changes as a result of the bpf_map_update_elem() call.
> > 
> > Fortunately, we can just assign the address of the map element in the
> > value that we obtained using bpf_map_lookup_elem() because that gives
> > us a pointer to the map value, and we can assign directly into it.
> > 
> > In other words, we do not need the 2nd bpg_map_update_elem() anyway,
> 
> s/bpg/bpf/

Thanks.  Fixed.

> > and since that was the culprit, removing it resolves the issue.
> > 
> > Test included.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >   bpf/get_dvar.c                       |  5 +----
> >   test/triggers/Build                  |  5 +++--
> >   test/triggers/pid-tst-timer.c        | 26 ++++++++++++++++++++++
> >   test/unittest/assocs/tst.collision.d | 33 ++++++++++++++++++++++++++++
> >   4 files changed, 63 insertions(+), 6 deletions(-)
> >   create mode 100644 test/triggers/pid-tst-timer.c
> >   create mode 100644 test/unittest/assocs/tst.collision.d
> > 
> > diff --git a/bpf/get_dvar.c b/bpf/get_dvar.c
> > index 1bb5eb002..073cca57c 100644
> > --- a/bpf/get_dvar.c
> > +++ b/bpf/get_dvar.c
> > @@ -1,6 +1,6 @@
> >   // SPDX-License-Identifier: GPL-2.0
> >   /*
> > - * Copyright (c) 2019, 2024, Oracle and/or its affiliates.
> > + * Copyright (c) 2019, 2025, Oracle and/or its affiliates.
> >    */
> >   #include <linux/bpf.h>
> >   #include <stdint.h>
> > @@ -150,9 +150,6 @@ noinline void *dt_get_assoc(uint32_t id, const char *tuple, uint64_t store,
> >   		if (valp == 0)
> >   			return dt_no_dvar();
> >   		*valp = (uint64_t)valp;
> > -		if (bpf_map_update_elem(&tuples, tuple, valp, BPF_ANY) < 0)
> > -			return dt_no_dvar();
> > -
> >   		val = *valp;
> >   	} else {
> >   		/*
> > diff --git a/test/triggers/Build b/test/triggers/Build
> > index d49b996a6..30991db16 100644
> > --- a/test/triggers/Build
> > +++ b/test/triggers/Build
> > @@ -5,8 +5,8 @@
> >   EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie futex \
> >       periodic_output \
> > -    pid-tst-args1 pid-tst-float pid-tst-fork pid-tst-gcc \
> > -    pid-tst-ret1 pid-tst-ret2 pid-tst-vfork pid-tst-weak1 pid-tst-weak2 \
> > +    pid-tst-args1 pid-tst-float pid-tst-fork pid-tst-gcc pid-tst-ret1 \
> > +    pid-tst-ret2 pid-tst-timer pid-tst-vfork pid-tst-weak1 pid-tst-weak2 \
> >       proc-tst-sigwait proc-tst-omp proc-tst-pthread-exec profile-tst-ufuncsort \
> >       raise-tst-raise1 raise-tst-raise2 raise-tst-raise3 syscall-tst-args \
> >       ustack-tst-basic ustack-tst-bigstack ustack-tst-bigstack-spin \
> > @@ -191,6 +191,7 @@ pid-tst-args1_CFLAGS := -O0
> >   pid-tst-fork_CFLAGS := -O0
> >   pid-tst-ret1_CFLAGS := -O0
> >   pid-tst-ret2_CFLAGS := -O0
> > +pid-tst-timer_CFLAGS := -O0
> >   pid-tst-weak1_CFLAGS := -O0
> >   pid-tst-weak2_CFLAGS := -O0
> >   profile-tst-ufuncsort_CFLAGS := -O0
> > diff --git a/test/triggers/pid-tst-timer.c b/test/triggers/pid-tst-timer.c
> > new file mode 100644
> > index 000000000..ae98ffbfb
> > --- /dev/null
> > +++ b/test/triggers/pid-tst-timer.c
> > @@ -0,0 +1,26 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +#include <unistd.h>
> > +
> > +void
> > +foo(void)
> > +{
> > +#if 0
> > +	usleep(1 * 1000 * 1000);
> > +#else
> > +	usleep(1 * 1000);
> > +#endif
> 
> Do not need the "#if 0" branch.  In fact, do not need the usleep() at all. 
> Actually, do not need the trigger at all.
> 
> (The test I used had that stuff because I wanted to watch the progress of
> the hash map contents using bpftool.  But for the test, none of that
> complexity is needed.)

Ah good point - I thought that perhaps there was a timing issue involved
also.

> > +}
> > +
> > +int
> > +main(void)
> > +{
> > +	while (1)
> > +		foo();
> > +	return 0;
> > +}
> > diff --git a/test/unittest/assocs/tst.collision.d b/test/unittest/assocs/tst.collision.d
> > new file mode 100644
> > index 000000000..1dc0ec7e3
> > --- /dev/null
> > +++ b/test/unittest/assocs/tst.collision.d
> > @@ -0,0 +1,33 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/* @@runtest-opts: $_pid */
> > +/* @@trigger: pid-tst-timer */
> > +/* @@trigger-timing: before */
> 
> Trigger is not needed.
> 
> > +
> > +
> > +/*
> > + * ASSERTION: Dynamic variables do not overwrite eachother.
> > + */
> > +
> > +pid$1:a.out:foo:entry { n++ }
> > +pid$1:a.out:foo:entry / n == 1 / { fdepth[0x1234] = 1; }
> > +pid$1:a.out:foo:entry / n == 2 / { self->start[1] = 0x1111; }
> > +pid$1:a.out:foo:entry / n == 3 / { self->start[1] = 0; }
> > +pid$1:a.out:foo:entry / n == 4 / { self->start[2] = 0x2222; }
> > +
> > +pid$1:a.out:foo:entry
> > +/ n == 5 /
> > +{ printf("%x / %x\n", fdepth[0x1234], self->start[2]); }
> > +
> > +pid$1:a.out:foo:entry
> > +/ n == 5 && fdepth[0x1234] == 1 &&  self->start[2] == 0x2222/
> > +{ exit(0); }
> > +
> > +pid$1:a.out:foo:entry
> > +/ n == 5 /
> > +{ exit(1); }
> 
> The fdepth and start names are historical and not particularly descriptive. 
> Over all, I would just go with:
> 
> #pragma D option quiet
> BEGIN {
>         a[0x1234] = 1;
>         self->b[1] = 0x1111;
>         self->b[1] = 0;
>         self->b[2] = 0x2222;
>         printf("%x / %x\n", a[0x1234], self->b[2]);
>         exit(0);
> }
> 
> with no trigger and do the results checking with a .r results file.

Taking this since no timing issue involved.  Though I think I will have the
test do the verification itself rather than using a .r file, since it is
perfectly possible to do the verification in the D script, and that is just
easier.  (Less files to modify if we ever change things.)

Will send v3.
