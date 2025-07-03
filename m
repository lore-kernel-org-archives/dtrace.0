Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E46277C9E
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751576395; cv=fail; b=Xh9XMtNVA2fyBxCkEM+38ocL5VBDgOf6LalUeoL165+L3KlG9FkQoQe/A/C5XDxMIxiXcymCldH7h994frPsJqE8htPyPosQPwF2rUH8R4Edjlud1IspQZ8DIT975O/YEU3bBjzDuM5bhKda8b5AfJcLGJ52mGSLvEq5qmgTsY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751576395; c=relaxed/simple;
	bh=5tmV5qOufOjHel6YuQ0/kzPyAw8FsB9MucVmnu6jMpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nygT+uCN2Ela3DxASZ6QewVQe0/l0c1CvvmgxS1Qs8sVmCl/1b4Ooc4WIud73OzXdDTf14RaSER6ywPpDumEyR4A5++eKC+H3OfnzmuFIvhbNi3xASzwuIuyb3o3msf8KEFZp3rTYYNsvLu8zW/nuueHK6pmgHRq8IQv+kZ4PrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WiYJSeBp; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pO4kSS2V reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WiYJSeBp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pO4kSS2V"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HZ22b011867
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 20:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BTFh1aIrMcNz2K6Hp+za681DFQrz2Yvq+GEzQB1ww2s=; b=
	WiYJSeBp6Os9myf7ySkkRqqhXuG0Kx+nhEa2EYhJuE9NSCX+cpeF942Od5qPlHu1
	doSru2xiqMShpCg2zd3m4/wgBOTAoXPrv20LdgNK/XzBYzi+cjs+bH0DYiR8LIb6
	2W7IbwVQtKoZam/jkSdpCdWSgRSG/y0Y8biZTItOoS6OqMTTI3SYPvPyuRlv1+vd
	7taKh4ckqb2ykATeFnBobOLu4+qUN++mdxUqn2OFzquXR5ivXzLlIRZXzBdp74T+
	HaroTUsW7AmXrSByDa/I/P3FmEkveJ2JnvXQ9+J+e2u8RTAVVsTXHwpVI2ueImQc
	+iBvmjsHlrevQhbUcwWTLA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8ef9vua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 20:59:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563J17TE024205
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 20:59:51 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1hwsbg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 20:59:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQAJ6idhgwV1jYHGUZxHsBEWscjgMdJR5glhdMrU/NQKOvSYafgr5TEpUF0OMFWzx2RIqPqnPYXTiUAy8uMCFS1rdvGcHBPxxwx+XsBcUNBHEMlcGfMOuVawf2IQo8PKnceyQk2hmaHpcBFzdzmH+6iI9y2B1ctZqQoBYXIIbOrteTlrHEUr/KJjobUzpcLwBG3W0t+65HTUvt7Af18NfrVWGSHi2HY8NKPxAvNDs7fat0ikUFGbCJ3HQ6aAji+j0j5TlTwiYH6o7Xi0JAtMmTmNhgqIvx6qngsSdHTyap+sgCNGnYV7zQ8Q2AqXABGprPOCBMtj3/NNP3TwWzlcqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wfrWlBrCS+MkNEtszeRMyI9JsyT4e4fjFNUsaAxUp8=;
 b=yEP7pFTL+SaFT6sReIaczwaQzEmhsi2A+2CqECQ/eulFmWZPAWob6utJ8cuQyTrgoszB46Xn6Gi9fxhPZEYjZhlZ39nU5r6ShNd3kS5k/0Bj1NwiRLwiakHJstp5oqwy3Jq3aP9M3VT2vmXYGndhv5uFMk9H7EKr78rVBkI37QSlI3pSXYThFQutP/as1KGaY20f5cDcJym5WvoH0D5XmXS9RuyfxInPtCRThNuVUP5Wf6upnH9qmiIEB10SJbyENe+BnwMqYj6ZzGPw07V7pbOw1KvegvNU72MZVlCWUXzM3NXE5iSBkwjCDdi9pi3PyvEInlbdJvlRFbsFZf+SCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wfrWlBrCS+MkNEtszeRMyI9JsyT4e4fjFNUsaAxUp8=;
 b=pO4kSS2VId/DhSKH/fPCBOeFOMAuA3eI/JSy9Ji2pKfl/hyjVzu/ZQg0hmHpRPic33uv+jK/F3XSTKEr0bUNuc47h8R99ITQz2uBTBEB7W+Jm+TAApyNjcA3rx6ZB9imN4h3EMZ+vnlz0TkN+EwJ4z6z+P+2ivCXF6xLCdkByPY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA6PR10MB8086.namprd10.prod.outlook.com (2603:10b6:806:446::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 20:59:47 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 20:59:47 +0000
Date: Thu, 3 Jul 2025 16:59:44 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
Message-ID: <aGbvQAmqsLA5+LaH@oracle.com>
References: <20250703113345.1273604-1-alan.maguire@oracle.com>
 <e660b225-4a3c-209f-fae4-8831f6c3229c@oracle.com>
 <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
 <afbb9858-e5a7-6d76-a6c2-23b46d8660df@oracle.com>
 <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
 <aGbLTOzqILN+3J93@oracle.com>
 <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
 <aGbT+p0DjRTFl7Oc@oracle.com>
 <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA6PR10MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd215b3-43b0-43b2-71f6-08ddba748b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
 =?iso-8859-1?Q?Q/M1Ac3XVFdwhoTYVll2Ss9bZIqXXGsNSwKr6LjraVevDJKFfVcL4326ah?=
 =?iso-8859-1?Q?aGa5joMnUU+Sz8Bie0SyZg2VEFMkOchG8LYIf1qxc0B4xqP7B2ZX5fxSC7?=
 =?iso-8859-1?Q?Rcw5ouy08ymTM3+pGibNvf8RPAHu9HounCvCmHgBk7Y1ABknuIUXrzMG9G?=
 =?iso-8859-1?Q?uPmahBfdBzovmB4ev+PJw7MfaDvP3ZdNodCwB+m30Xq5kACLy0whlv6la4?=
 =?iso-8859-1?Q?zLCQqHgNwr7RBaM72cpq5qPJhzUtVD7OUwcYUXdLtPhYIQR91hASqc9vCO?=
 =?iso-8859-1?Q?8InTfx8cI36k/f5CERmeK45eUxOENwg4ETQDMMZBRCto2pR7Qenhx/DkVM?=
 =?iso-8859-1?Q?Een+Tc4d9DJwCn/XgqS6oZLSrgDBp9TnqoNNSemu1zVZ2Bc8IgkM2QYxNr?=
 =?iso-8859-1?Q?NvMix4pa1SmXCNmfqoka/dRvah3W5eUmVB+K8BA4MCUFcSzusvlISsqkFY?=
 =?iso-8859-1?Q?pNN4LZ7JWXGTlSMRzz0iBKgaWj/6b7jbrTR56OCzgVIjf+gvMx/NHhFQfv?=
 =?iso-8859-1?Q?Pf1ySFZMJe10a6CUKpFwxhLM11RZvm41eQftdR6+Xswk8XNOpdEf6R987P?=
 =?iso-8859-1?Q?vOnTwJQzzmJt2dl1ek2IgkEc5cn6t3yd4+mZalc4QW+SrJ8ZXuty2C7Wuz?=
 =?iso-8859-1?Q?LEMFolG/Tquk2fw9tDyJdDsfLfIFChQpz52B4hKipeG1DtLFwV/JvD7ptp?=
 =?iso-8859-1?Q?aF2iSwZQqW28dR2YCqOr+VUzni7ki375wjC9xNaSfsxPIZjL1mL9LRUHsS?=
 =?iso-8859-1?Q?/QuRljOXjc7RvDHtJlwebU42uPVWTCN/CLJAIi2WazK8zf8JlitIwOJwAt?=
 =?iso-8859-1?Q?ndxj+fF4NTKcdpXu4b184ImeW6vlC5ITG23TlpEuVKDA+blBKhYOZeXhVy?=
 =?iso-8859-1?Q?2Lwdz6G/HVRdnc9JRkVkXMPppfC5JYG1kj2T+fH5n0bVYTc2ulknSF01az?=
 =?iso-8859-1?Q?0gXSTktp++ayCcr18euetqfeI2g3V7V6n1GwSEUgkGP3OsPhBre818awWO?=
 =?iso-8859-1?Q?tbEElcoM7KdT/HenDi0zGkH9ZsLDFQocTFm3J5LP9awuOt7YsDntHtmyy1?=
 =?iso-8859-1?Q?N012wOzPS29tBSyLoL2Ez5rtZNSdi/2EaxYauZNV1BROpSx2G4duW7cJMz?=
 =?iso-8859-1?Q?fGNjzWI7kZWFrVXZqp3DH5Wfbdi4vgDb6NQr8PULnOv6MUfpXhLgCnnymO?=
 =?iso-8859-1?Q?Ty1M3Umk4p6CklOMZREeBJ5hQeJxCFM/gra1MNtb5oINtR2vhrLquGShIr?=
 =?iso-8859-1?Q?Qxh/wUyJkD5iD4ZjzNhP4JR0pGGRUmb0OXr6AQzI8j3v8Kz/Uxek0vG3AA?=
 =?iso-8859-1?Q?Z92Zjemk0DBo/T9FpBdtTtd9JSGncT+zmt7+STpHO94AkDFr1dQ4E30krf?=
 =?iso-8859-1?Q?ca4FBDPF+h55qDrJDhs1kepVyyPi+gUItlxbKsc8w9vfP3sVfLP7slSZH/?=
 =?iso-8859-1?Q?Z22BC3+UIlCFTS5qy5iVU1HO/PJhiOSWoBZm3CxvTpQtUeBYL9rFzAZb5+?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?iso-8859-1?Q?iDJmd6oaJ8adK3gY4+DLRxul9AbNzq+QbsK3IeO4HVx+tlsE63+RALZjPf?=
 =?iso-8859-1?Q?OSaLaC43FgKZyqVSMwBgAGbHsAh1NBRhdoLJshFNPwM+KP5CWSdVGf69t2?=
 =?iso-8859-1?Q?HJaQJDQrgOfcnL3mj6eGiukwAwqfbARCALGNu+KRSa6clyLUcxkWaJd52t?=
 =?iso-8859-1?Q?ukFUkqhAWPHixL1AA+NTG29IhzZ2eY/b5/SRpQmBEAZv611eW+mHMW5USI?=
 =?iso-8859-1?Q?li/zYdTigJBuwbfka/gNj792LcKyzqXpVGeagiGbBfb80wct0+Xej3Xd5r?=
 =?iso-8859-1?Q?r3trBFxXyc6FSE2SemvuLBMmWKuh9dyAYJYhIArhr21YC/2rnpApB13U4X?=
 =?iso-8859-1?Q?+yMAjFvpPP5Ck4pE/0/+f9+os5ZjLvhYvLeX1BYPwCWTpBuJFX21ZAg9Vl?=
 =?iso-8859-1?Q?YckFJZt8S+9MCMwW3R1FsFjQnDuu6xHznQ3IvDY0Hl+zgQO7ysLGwfVIJZ?=
 =?iso-8859-1?Q?QbEFmSTCs5bXpwq57GYMfb0ZxoVjT+0tG0TTZlxiIGM90hYtaKtLIcGSeu?=
 =?iso-8859-1?Q?Vf4sT+07NoOj7TOkPTU+IjmPBnUeq2XPTGQVMAlBkHJcVvZQ/ZmJuBKyDy?=
 =?iso-8859-1?Q?9513KY+DZGwu3XZ/avmJyeQUqt+NJZyc31uAVb38CGKSgA5GgG/TX+s7FH?=
 =?iso-8859-1?Q?9yTKP54/BO8WmMLpT2u12L9b3uVS5vN+McIxpluenMI8EGsI/WdvbCoqLr?=
 =?iso-8859-1?Q?/binWCIjZ0U5TdA+vPNKK7RYxWSPcNW/hHFSdXsn87wPYuP4Mq7AHom68y?=
 =?iso-8859-1?Q?Y9L9BK07TQ0OwbRrXtrxl52JGRITYhZBHB7xbDd3a5kEehKmC8hFxT4c2C?=
 =?iso-8859-1?Q?kScueKGY/XzXQE4YnmFDWppx+ppXYfuiZ8JXl8ov4ZQYGpvkw4uKTY+OKt?=
 =?iso-8859-1?Q?lsMCMbGHjUt+4tqMNgA4IiUbHhe7+yuPV9GDxGeftE3liyHZ1IWAjLR4ml?=
 =?iso-8859-1?Q?nm3w5teEjOEUMUzb/VY8jbWZcWOkWVl2s6JGirLuPchpOg+IOvQsm7Exjt?=
 =?iso-8859-1?Q?pUva+2bUaHyvG3jmhhiD/6L7/HB60aw+N2r/Cv/9F44bjkh8qmDT1cNq7G?=
 =?iso-8859-1?Q?iq+29531DBtqjnOyFRpC6klohbDJrOOFSS87t2gqdfFmc3XH/7l7tzVfM9?=
 =?iso-8859-1?Q?OU+vLVsGJ1lSXzpAVqEIOtqU++/7K55STY1ucvQnW7PpSBecqHzHtxhhpn?=
 =?iso-8859-1?Q?6JF/AWW0LixbE8D9nxB8p7Zn5wH4qMOQbxgbm0WKIGfGzbYBeeo5l8nemv?=
 =?iso-8859-1?Q?VTNoz2ReRRGUZGoWVKeKXdRrypQMlf1EJMFYWF/86NPOMw3ZN3c5lGzVr0?=
 =?iso-8859-1?Q?9pAXSbmwEmz7f/d9hsCGOMERQqIwMRFFR8js86JHM7ExaTIe/sbmXcXW1D?=
 =?iso-8859-1?Q?m40NEtvqP9MmEfz/0WIDr+30l7WdWTQmGnRXUnVc/2jz5lc681YxdE2p4h?=
 =?iso-8859-1?Q?zrSMTeERUASLGcczuubpxsPwj9DFOlS4/K9HJV0lOPx97WJUiW7KwT7+w0?=
 =?iso-8859-1?Q?EDL5L69ErTZ+UjHXTU8vJ55aQW905HcLskk/zMpO0XJL38Q0PdZygpvFpg?=
 =?iso-8859-1?Q?scSc96pqT4xmvlFaIROR/jWFjPFrnhmQFxucMjo9gv1vcBgTFUapSnblPR?=
 =?iso-8859-1?Q?4g9B94mWAMbv/uoM0l9CEowefvQyT8fg0NbqpinrGcwBuCN34UbISFMw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 HosgYf3pZxzLl/GHBHm+f1zudvK53ou0idxekZZVMS5JkBRJa6yEzE8eS4p/4XyyhcMcynMUAHyS4IidbjJ0pJ1kE4ClfDNpRsgpfz8nftKymyne5AWDXqJItXfaJZ1PPjlRTZthxpjfnimeZBaTknAkSlKKKXMdsxsOJ7Et6EreRv7X/OFnfRWgdhoOPQnsJwhN8rNWSCntNAbOTanOnErDlGx9niMlwqUvgZ8F32xWLr6v/+h7GzWC29/AodXd/vX3u0Hkq4QgyW+MKZ5n8YBdDOIcTD4YspGULSpoP3gOA9qGFLOdbV8Hfhodk/bfK/zVqnNp48ATKfxGx4eySJ+xLH0C1sudipdST1IHOfvX9BAia+cNGI8MEdMcQ2IybKHQJniTv3JtiHircLNWu8iyYCY846hUb+ABr60cPR/NdQKPzd43HNrKghd20zBzhQ1+YeuviJEwT1hQcWhubkMFa71VEUpP9CgzBIq61ipoTYTZc1rzfqk0OMdghaz92ses+wbzlfT1hB2TWxmtTmCvmuGSCdqRqPivkUMMAndxBaZyzd5HUEwZzIR3ps4FaXYMKtajd73bSAcwB5FF8tA3i/D1W/157/f6uauZkOU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd215b3-43b0-43b2-71f6-08ddba748b5a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 20:59:47.4919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QX3PHU4GTTAzOeenfFjNvQHWZr+p5ImhBRqlEHhyW1IY8AX0LP3BAqxQ10Rg/cFybTltJIX1wY2jzkYnu3g/IZ9wvwrjiC4e4fhG/7C25d8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8086
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030173
X-Proofpoint-GUID: XsIREbEim1NR-pb2V7ZaL4UENF-rRCw_
X-Proofpoint-ORIG-GUID: XsIREbEim1NR-pb2V7ZaL4UENF-rRCw_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE3MiBTYWx0ZWRfX7gVfLejXjLbV 1YKaQJLiaOWwxjlQ8yVr9sb3eMdgrkf7uIlgzwPrN3UxUzMtIOGI1cFE+TO5saHPa8k55zrXpK+ UY8ieqK3Lao3lVrcHLFJhD5oceOWw9iyum4aj9IlfHZN1iQeaVrGmy5Q+rSQj/A/z8nYGc3UV8W
 2iZiC5ifyO2+9C/zUxXpPB8jvFb+9txumFCxEodBE3sFF6w7BPjLJYUb2hCN5Lc2FlNqDa4nQWM yR/Dy5Ii39WF/miUTFiTRJjcdIQrTDnQMcXQRFsHiS2dBnke3VX0+6Tap4mdVvEHg3/CS097UP9 RJgmuennzAdT5FZZ+VYgEY5eou6SWP1kubghll8f2g/KS9tgm11USdoRd8JOECqVTBZAS1UPn1+
 7kWrU2HjTjt2B0ldu58tCrdEkazjSy5tWFPJKheqawczjF5lPIjR9YeVDW81/HHnXuK4wZ15
X-Authority-Analysis: v=2.4 cv=ONgn3TaB c=1 sm=1 tr=0 ts=6866ef48 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=qdfqpioPG5fMJyJ4niwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12058

On Thu, Jul 03, 2025 at 09:23:46PM +0100, Alan Maguire wrote:
> On 03/07/2025 20:03, Kris Van Hees wrote:
> > On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
> >> On 03/07/2025 19:26, Kris Van Hees wrote:
> >>> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
> >>>> On 03/07/2025 18:06, Eugene Loh wrote:
> >>>>> On 7/3/25 12:59, Alan Maguire wrote:
> >>>>>
> >>>>>> On 03/07/2025 17:43, Eugene Loh wrote:
> >>>>>>
> >>>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
> >>>>>>> patch 3/4 feedback).
> >>>>>>>
> >>>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
> >>>>>> send probes?
> >>>>>
> >>>>>     dtrace: failed to compile script /dev/stdin:
> >>>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
> >>>>> inet_ntoa arg#1 (ipaddr_t *):
> >>>>>     Unknown type name
> >>>>>
> >>>>
> >>>> Ah, sorry yep I have a fix for that one in the next round. Basically we
> >>>> need to add it to the core set of typedefs and add a type for a pointer
> >>>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
> >>>
> >>> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
> >>> this I believe?
> >>>
> >>
> >> Unfortunately the #pragma include doesn't do enough; it just defines a
> >> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
> >> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
> >> typedef to net.d and doing the pointer lookup/addition but that doesn't
> >> work either. Seems we need the core typedef + pointer addition or we hit
> >> this failure.
> > 
> > Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
> > you should be set.  That is what I did in my priliminary tcp provider impl.
> > I do believe that works.  Either way, we use inet_ntoa() in the ip.d
> > translators and that works with that typedef in the file, so this really ought
> > to work.

> Yep, I tried that in the v2 patch series; Eugene hit the undefined error
> in one test and I now hit it consistently for all tcp/ip tests
> unfortunately with "typedef __be32 ipaddr_t;" in net.d.
> 
> My assumption (probably wrong) is that the include of the library does
> happen but nothing triggers the pointer type generation for "ipaddr *"
> in the CTF dict. If there was a way to force that type generation at the
> .d file level that would be great, not sure I see a way currently tho.

Well, like I said, it does work for ip.d so I don't see why this would be
any different.  I'll have a look and see if I can figure something out.

	Kris
