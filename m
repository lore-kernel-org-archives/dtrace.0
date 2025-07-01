Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87998382
	for <dtrace@lists.linux.dev>; Tue,  1 Jul 2025 19:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751398063; cv=fail; b=Fl1Tw31YSQS1QAr/oTbcw3fmuEqLzvtVm6LjHxo7l0nJfy/o9sBZcoBjcw2//GAsFoRIDWLNjODuJ3nwQdUKSpVYGQywsqr7zuG9hm8HYoWjdT4t9b4z1LQYCkIrbPpodrNQRoVS/hPLQgKq9ZYd53irEDRI4rUr3Vdy0Serqqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751398063; c=relaxed/simple;
	bh=2U/g+zyxdTZoWCskpbS0MvJjmGDM6I34YTwYvYFGaMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ndlGjZ1pv0rRPBfYhpt/7qY+AjTtpwRbMv/YuGqUkzoXYzTYKei6j64uljs8TXSbh5gpDJ030daV1fv4ytCuZuanDOOBuPqH8hBEKQnGpG81tgYbu+jOQbIh+fjQ8/rorv2PTI0STmDE+VtVyAUoDCafeXcssYGZMUlaOC9hvWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pICQYnhw; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mtvxl4O6 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pICQYnhw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mtvxl4O6"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561JNF2C012477
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 19:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=HmTSJ5boBfXv9fWo6XC2JpqrutpTN/JXZ+2/+mVwr6k=; b=
	pICQYnhwNRTkwIEXREOlcoHSDNUwBUogBGkw5Fzfdb4vVSAenGHQTIf5WNEy1CQq
	NSY87bnwRGi4BjOpCRh3/Iq60pDpzE1XgS6aZXdmZwgbfThhuzXrgbmB/iT+BQ5t
	f/zL+yGj9Ale1eqKeEsgX6FiWTT/sFf2Q8uDwWosYITQbZPMiY96EvoFeejkHyDP
	HGipgCqWWX8eo4RKuiTwwIIvqDQP1ODijhgo3MVQl80a9K1/rRpGdvZfd0JJoC+s
	4b7ZyhR1WrzVfuptF4jAUyG0qYina6BRqqJO7K26d+/vPkfiCSe+WEtwMZBnAGQ2
	6G3Tcthl/TSnEXlN5GfaPQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7vt77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 19:27:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561Hxkrj033603
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 19:27:39 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010066.outbound.protection.outlook.com [52.101.85.66])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ua8b3h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 19:27:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMiNYtVUjG2Woy0thG4sLtjtQHQmS3UEDX3M6E3jMbRqJrQub3aOIk7XhfH5ZFVEj8AjlwjFEtRJlLw72OP6/agV6Luy3ZXHcOxQ+BxXicDlrU//mrDoZIgtN3juRXrd+xhwsjI3P44AOc8+9iKVy4RTT1f0L9xRp2aX3vtmAA09WitMWTwLu17UJKGIMW7pWz8Jr9VTxTs7gGf5Oio37TIltw8LOH8WrJTs1VB/XEMOptd2577TOeaAky+TpIGOXSM6u+bNNQZfu37GyvxfrExdXqZWxP9WteGJfcry3RN03mI4HcT5unFNf/p2KsE8qNLNYT7igh88I8Gbyi7mgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWzFIcU4gPXGOOO4+4xZUa702a7Qw7wYV/QqptaNYqE=;
 b=WVz90GNBT7Jg2Ysvbjb1QVNAnlX29fKdDTachf5boHEGwdOqZle3FtIAfrnMLAHCA6PTp4Qp9iYKswHv/xYB7qfLLR5GZgacCBk9sO6L5hPfnaZeA8ZbjTJ25XHKSiwEVYd8CGB7zpGUYZv0cFGiI/bAbRvHchul4ImxLkpUNcoNwtH1spfSXh0ncVYUPiEmhFj2DOgt61nJcINL8h3T4rPeP1p8oFKmNtaXtClpfVax/AqSqG90vimCGi1F3jDWOtIe3whTtQLIpFeUHVBHCaC13VrBoPB4JQ2MzQc7cDkCDp4drQxT4ixJQ8t7KbCntyyLKjSK4V4pQx6GzsBhpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWzFIcU4gPXGOOO4+4xZUa702a7Qw7wYV/QqptaNYqE=;
 b=mtvxl4O6g87qux1xUKWb14nTVy+cMwoo02SW/OPRM/FyfXY4yy++jssJ7ENB5Izn1TCGkE/4u8JNst/eiuUs7PM6s/eIswrhJgDWIkB47ZSx0wpuN2hIGsxmq58py8Y/JgJ9lArllN3ECxw/mzJLfS/iF9+XTkFNk0sKgKazkYw=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ5PPF8C7834C85.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Tue, 1 Jul
 2025 19:27:37 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 1 Jul 2025
 19:27:36 +0000
Date: Tue, 1 Jul 2025 15:27:33 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 0/4] DTrace TCP provider
Message-ID: <aGQ2pe0taoYjUy84@oracle.com>
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <cd4946a0-f529-d927-24d5-0c468119f000@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd4946a0-f529-d927-24d5-0c468119f000@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ5PPF8C7834C85:EE_
X-MS-Office365-Filtering-Correlation-Id: e72abf6f-17df-4833-d598-08ddb8d555a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?z/IqnGrb8J6/0YsoY+I+u303gTKgm5UCiilvZvsRLjqIQvVEloIgcC71FU?=
 =?iso-8859-1?Q?bmILja17Ok7SSQIMp6vGAGXQ83GiP9AXD619MbBg091sYMQLaon6VTCwCl?=
 =?iso-8859-1?Q?2dd6Gt9nApGcZng3VpT8LzR3vwRUphIWNAUVloWM1+pSRiCF8jevOX1h3O?=
 =?iso-8859-1?Q?JVKStHDTXrK+o3c/1OaqXfict4lS61bVQt66wcJwMs70xTYAE/152zl6w3?=
 =?iso-8859-1?Q?xRWezjxYwCTKQPzkH6r+ukH1zLM/KtvWjy/nIndSaEMaH13SIwnDYwccCL?=
 =?iso-8859-1?Q?HfcO088gXDYFuFDuwCO5eDQywLFMRiLfPx89ON+cPpXa2h+khccguFG/ez?=
 =?iso-8859-1?Q?8k28TwAHCvQaUHMjxyGZ1awoeuXLWg+QimFg9bfSlujKvCMy7dUhZecYoq?=
 =?iso-8859-1?Q?VzSttWiGW5eu284i4vNHP3kRV2FpNtbGpC76xbtS7lUQZrBFzGah8Fv2hj?=
 =?iso-8859-1?Q?F1fuQzyo9CeGIhq06CKDMcLT9DFlhdToGEq+CXjlXIRryfhTuGB0M5CvFZ?=
 =?iso-8859-1?Q?Ttam3wKn9UQn4lvkfkn1KYiqA/NXM9purT059AN0nqSXQcxNvfizE38IB4?=
 =?iso-8859-1?Q?PvImFZBGU/m07yWCmq0FU/oGVDBMpJP5Ej9FcULuC/AdFmkSGGgeYo8b35?=
 =?iso-8859-1?Q?6fA4r4JiZsom2xDbjUfwQCyF+KgADUf2rY21wND0kDFC+kAf9rY4w7jHO3?=
 =?iso-8859-1?Q?Pu9QZ4ltpRt6n0PGuktRMINkjDONj4yXe6hjeUxYsHrOoPK/D4muxEFWA6?=
 =?iso-8859-1?Q?KX0MPdV3WJEzCM8zwjcKQuw3G8Q3JdRh0h9TE2snhTPhd+qcQQNxwYogeF?=
 =?iso-8859-1?Q?Pbc1Vun2DJe71CJnGjbN1onnmt0RguiV4tprv5v/MCMGpKlMbzBi79+Oe+?=
 =?iso-8859-1?Q?OlrRJEpWn080C012roaczI25l68KEvfzhHTmJNFvALJMEHEoi7B1H0XmLD?=
 =?iso-8859-1?Q?KS6hpDq7l7LFPBgYyxe/3LBMOhzs8omSX4C+HMYhToFvMjfSG/hB69BEnl?=
 =?iso-8859-1?Q?66Co4jYXFbJ8r+Fs78qHmtJBtcg+P8awhIT2vIQirOiKpGp5f1gHfBD4Zg?=
 =?iso-8859-1?Q?DyC/AX3t2pXgy6+LgGLmT/9imIIxJ7qXYYzVceaSZ1rWQsAQ2mhbo5OevZ?=
 =?iso-8859-1?Q?fDr4iysLkdysypM9ZnfN+PAcmu6nzQtEwrGl//CYfxHoY29/kjDqWGuRko?=
 =?iso-8859-1?Q?tZfM58+TfdeDzbSOzWxfUO0b2D2rcHfZnKZXoIFoQQ04meSMO1n60Z4OgP?=
 =?iso-8859-1?Q?Cf+ZQQTx5ynvG8AEXYGN4q0SNzO2izSKCFVkhrRW2suS5vADp9Gu/l1Ive?=
 =?iso-8859-1?Q?zFo+n3A01RpTkKpNVWcYBNILGuz+0vTcNxt/x671/b83ykVcJPVnVM31yE?=
 =?iso-8859-1?Q?FEiEplRnLTfsZ+u780YVhkxklxcw7aunRBi8dquKl4ygYCx/PrA52UZZYq?=
 =?iso-8859-1?Q?0Vf+/DGWPrASag/Y/7LOxWQxLpmRFzJwrapEE9MVIQEWWGVezZPtBs5NdZ?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?mlum+MY3xdnGmVVvBnfkPAoW3yvPD3cjnQcyS4GWEEHyEY+sr1Stvcd2xN?=
 =?iso-8859-1?Q?x1JQ7/sE7VW47ZvEfwaFc2yG5CnkfjFk/nPpHb/M8X4wYbwaMOxatQQ1PD?=
 =?iso-8859-1?Q?WHMUpLmEBWcRxaVMGUykgkTMUlqgS/D0fzsaTaYcZ9eZ4l3800Qvc4zrLw?=
 =?iso-8859-1?Q?KjGvLw5v9wf7J192PdK4uMUVYYhJXLVr+GzQHzCiUGdCW9WuwlyVuiew2p?=
 =?iso-8859-1?Q?IhbEVXi62GRWx3nY9E22x5lotmWNQFli0SbN6PM1LPyp27KJDGMCbR1IH7?=
 =?iso-8859-1?Q?nTLHYswDKsK51OaOwntJckDES0i+IKRgnhBIB7tALYQ2A1nTvX5q8ItNff?=
 =?iso-8859-1?Q?q2HZlcdVmslZLo6BsNN6aItiCNjZGe+14fQ3teMyyvvLuy4l9REJKJQjEW?=
 =?iso-8859-1?Q?ldtme9EDo5o8UkspJ9J7RnIudrlz1vWKl8QyLWYjDW2Mc6QZkGs954IJgB?=
 =?iso-8859-1?Q?UoA0BNf+329Adlz9YTwClqdXe1yhdcaAHcEKH8cyD8o8VfjLHO0mc5PtQV?=
 =?iso-8859-1?Q?IHGZQxeopCIVFOKBf9kiB7rS+RStgkBRxBaQfUihxTs5TVhAjo+xq4oQE2?=
 =?iso-8859-1?Q?YKR319hO9MRLFnUuUGpmxBwDEfSEu8dkkNvxa1nGuiTRdzlvz66w0t1Ybt?=
 =?iso-8859-1?Q?X9eqAB6O0SIii2s9mxfV6h0LToAFDESyiRhKVHUfxZeKxRpkIicni2XzTe?=
 =?iso-8859-1?Q?yGivdFrZCVrnjusGbgB/HSFwOuUpb08H0Q5AbyoMTNunuHuJTtaLRV6hvt?=
 =?iso-8859-1?Q?1HCbpxLRK2rq3Bc+CzraRdyOzhY1ndQ+LwrI8eqShP5TahoBnImOMkHYcc?=
 =?iso-8859-1?Q?cTEzzTnv1P6Rqsiy4As46K6c4W/8rYL/VItntlb6YKx38lB42HPr/jq6Dd?=
 =?iso-8859-1?Q?qeOWgD4q0vZVid9mufXu6guLvPj6RUfkjbgEDTlSyxoQ/w+A7zrraMItA5?=
 =?iso-8859-1?Q?h5S/OljNdp5XK0iS0bWBGHy9m37Z1XfJhAZwNenl31O9gM4iabliUL508K?=
 =?iso-8859-1?Q?dYSFVEvxLtajC4Rl+I9ek7//+7i6cX7nYRxzBUqRDc1jVvVL6o0zN+/6wK?=
 =?iso-8859-1?Q?+/tPKVNoJ90mgN3WH1fXhOkCmRbpKkIa+648kBRzIJCnDgM+DadbgP74BV?=
 =?iso-8859-1?Q?gGS64L0Mkcv+aXSRW6Lh9XR7/EyNy1g9y9G+2ubkEUMt198/b4zgpB2gy3?=
 =?iso-8859-1?Q?osMXdtjVXRt5X/7y9j/PMfnRqH+jgmv0TwQ62FAM2TXCGz/QvkBGlzUksf?=
 =?iso-8859-1?Q?axOyqJj7t4wByFwz96V8B/ykpY6oH0wz1mNqcdhC5QPOYx/YC00Ftwuw+5?=
 =?iso-8859-1?Q?Aa+aGcYhw12xzYeAl3we05NI30ocZzNitSYPK+/aNCkQax6psXCrd8dt9x?=
 =?iso-8859-1?Q?Pi0zPMMGI9qTuHlPazsEc/YUpl22T//o4IinC/SScdtrz5X06wXyGa3eVs?=
 =?iso-8859-1?Q?4D4B0TuDOhtevWLl9VghmTRL83octZzlen//BcOLV1Q6TGh+oEE+WjrLvM?=
 =?iso-8859-1?Q?KJgoQ8tBta0e99nHN+FaSSNyyqm24ga1SvJlVMQfGf9dri17p4QkyWTSlV?=
 =?iso-8859-1?Q?VQ7jTHAbr9JiFynQ6D5Xr+qZnvt/5fGv9HyUDT6E586Cpf3VFyx5pwFtTo?=
 =?iso-8859-1?Q?OIXeTYEPCSMCWaktzluV/p/ngnP8EKztQokB8EamG7QcXzEhXcbVRnMg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WIP4jcBgqOr6TRljGSbdOu8GVHKxP/TRzzUp3OVqgyqb3TkAoRfpNI/7k4oEz1IP0JKqDbolaDiWiROO7WWLKrpUUnUF0f6f/EXgbLCU7nYXumqeZINJIu9+1yb3ZKKYWkhRzfJQfjrsgbciTaOC8xDd9W8qZqgi5zvu5SmtMJ0OCVGHXyUhd2Nh1RaVKqwcv+i9GOKZUB11Qu9CNt1vaoeLn9Teocy+p5qE6K8ztVxm4fZLE4HEfYLxL298429l8MGdWVAZOJVwon+78vy69Ed/1EOl1LW7FUp4BMxuDKqufjNj2vBZy61kpgM7bQOyu1v1JWsNcYiYjlQ6UPvrjVwFrT/fU284Bzniq0Fi+qQ4SPfuQt5e8h3rrFiFDMdbxqE6grk57d1cydF65y458sGgO85dt3cXbTmtkfeynBL0HpS2VW5RpqxicMEeYikeYsEocxRaMgETOBejMYKa/YWgN5Lf2o7Pr6XXC71nU4DJ/1tgrjj/6JdpjnmUElFcZf7qis6uDN+RBSVxEKIsdO5PGDyD3tyPqH9QGA6pOiFtvUH3pnQR+H/YAxZUvZL2iRN7QkLEPUBEiO9w4nnQXb8nBXu1TmHFXOr8Og/olas=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72abf6f-17df-4833-d598-08ddb8d555a9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 19:27:36.2068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7fZXKIVf3GUCoABZ3gnf7YbMBmgP9qkW/v58SmH/SliXkftCmnGOD5Okw5c3yQGvVtSbk+Oc75YjcbmMuQvwq3gYExG3iEIvIRw80D3elI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8C7834C85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEzNSBTYWx0ZWRfXxzhgd8cahDju whv9EAhRWrI02LSpJnQpcp36mi6cDAhHFPzvD2tevL8bH4MMjIK5FRVj7+q6vQgjn3Pld/neUYK rtfFJq/Ym9nDpU6/t6ZqDFBd0Pj3wMtRS1kBKuJU8lEzAEA8eb1QCoBxJqkrg+FbO4BiBw+/oqG
 OSBblokF9sZOQvUJd07VilYlOYLjruEjV5i04T+VHqxrkazCS0hFAZhcYWgwG+lvN9yFwlWY9M+ QdVUKkAcH1X5ZMRFn8ceViqpCOY7xscxoOnUBDG7JIh3L2V5ov4hq7r1XdbQuwQjJeQVk3kybOH onI5ZLWdGupya9hjIICxV/G5Hww/VRv9d12SydX1+kTcrCG2OtdG8gptALI8zbS8zcYxYI+bNYO
 Fw1maBWoiG2FDx4wuz1WVipxkre1U2lrysksqZgK1Vka4pdTgKZbbcO1fVm2gqZMY4Yudfh2
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=686436ac cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=M8JsVNgJDlnRE6kBPTQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: r4Xsytyts8pezHqk5m_5CsRLTqWcDB45
X-Proofpoint-GUID: r4Xsytyts8pezHqk5m_5CsRLTqWcDB45

On Tue, Jul 01, 2025 at 03:08:59PM -0400, Eugene Loh wrote:
> Incidentally, looking at the subject lines for the patch series, I see:
> 
>         dtrace: move get_member() to dt_cg.c
>         dt_impl: bump number of TSLOTS to 8
>         dtrace: add tcp provider
>         dtrace: sync dlibs with tcp.d, ip.d and net.d changes

I would suggest:

	cg: move get_member() to dt_cg.c
	cg: bump number of TSLOTS to 8
	tcp: new provider -or- Implement the tcp provider
	dlibs: sync dlibs with tcp.d, ip.d and net.d changes

> That is, each line is prefixed with a component name.  We do that a lot for
> "test:", but otherwise the practice seems to depend on... the patch author? 
> Anyhow, I claim "dtrace:" is not very useful.  For patch 1, all the prefix
> is saying is "there is movement in the dtrace code base."  I think the
> subject would be more direct without the prefix.  Same for patch 2.  For
> patch 3, if one wanted to use a component prefix, I'd think one would use
> "tcp:".
> 
> Historically, it looks like we've added new providers with subject lines
> like this:
> 
>     rawfbt: new provider
>     Implement the io provider
>     Implement the ip provider
>     Implement the lockstat provider
>     Implement the sched provider (first part)
>     Implement the proc provider
>     provider: Implement a rawtp provider
>     Add a CPC provider
>     PID provider implementation
>     Add a profile provider
>     Implement BEGIN and END probes for the dtrace provider
>     Added IO provider support for 4.14 kernels
> 
> Everyone has their own style.  Shrug.  No big deal.
> 
> Anyhow, personally, I think the prefixes don't add much, especially for
> "dtrace:".  My suggestion is to drop the prefixes, but... your call.
> 
> On 6/10/25 09:58, Alan Maguire wrote:
> 
> > This series is a first draft of TCP provider support, where the
> > probes are implemented via underlying fbt and sdt probes.
> > 
> > Due to the use of the sock/inet_sock_set_state tracepoint, intended
> > for ~5.15 kernels and later.  Tried replacing this with
> > 
> > fbt::tcp_set_state:entry
> > 
> > but this misses a few state transitions, so stuck with using
> > the tracepoint.
> > 
> > All tests under test/unittest/tcp pass unmodified on an upstream
> > (6.15) kernel and 5.15 UEK7U3 kernel.
> > 
> > It implements all documented TCP provider probes:
> > 
> > accept-established, accept-refused, connnect-request,
> > connect-established, connect-refused, receive, send,
> > state-change
> > 
> > Changes since RFC:
> > 
> > - fixed issues with test failures on UEK7 due to missing
> >    SYN_RCV state change
> > - moved get_member() to dt_cg.c (patch 1)
> > 
> > Alan Maguire (4):
> >    dtrace: move get_member() to dt_cg.c
> >    dt_impl: bump number of TSLOTS to 8
> >    dtrace: add tcp provider
> >    dtrace: sync dlibs with tcp.d, ip.d and net.d changes
> > 
> >   dlibs/aarch64/5.14/ip.d  |   1 -
> >   dlibs/aarch64/5.14/net.d |   6 +-
> >   dlibs/aarch64/5.14/tcp.d |  52 ++---
> >   dlibs/aarch64/5.16/ip.d  |   1 -
> >   dlibs/aarch64/5.16/net.d |   6 +-
> >   dlibs/aarch64/5.16/tcp.d |  52 ++---
> >   dlibs/aarch64/6.1/ip.d   |   1 -
> >   dlibs/aarch64/6.1/net.d  |   6 +-
> >   dlibs/aarch64/6.1/tcp.d  |  52 ++---
> >   dlibs/aarch64/6.10/ip.d  |   1 -
> >   dlibs/aarch64/6.10/net.d |   6 +-
> >   dlibs/aarch64/6.10/tcp.d |  52 ++---
> >   dlibs/x86_64/5.14/ip.d   |   1 -
> >   dlibs/x86_64/5.14/net.d  |   6 +-
> >   dlibs/x86_64/5.14/tcp.d  |  52 ++---
> >   dlibs/x86_64/5.16/ip.d   |   1 -
> >   dlibs/x86_64/5.16/net.d  |   6 +-
> >   dlibs/x86_64/5.16/tcp.d  |  52 ++---
> >   dlibs/x86_64/6.1/ip.d    |   1 -
> >   dlibs/x86_64/6.1/net.d   |   6 +-
> >   dlibs/x86_64/6.1/tcp.d   |  52 ++---
> >   dlibs/x86_64/6.10/ip.d   |   1 -
> >   dlibs/x86_64/6.10/net.d  |   6 +-
> >   dlibs/x86_64/6.10/tcp.d  |  52 ++---
> >   libdtrace/Build          |   2 +
> >   libdtrace/dt_cg.c        |  39 ++++
> >   libdtrace/dt_cg.h        |   2 +
> >   libdtrace/dt_impl.h      |   2 +-
> >   libdtrace/dt_prov_ip.c   |  45 +----
> >   libdtrace/dt_prov_tcp.c  | 405 +++++++++++++++++++++++++++++++++++++++
> >   libdtrace/dt_provider.c  |   1 +
> >   libdtrace/dt_provider.h  |   1 +
> >   libdtrace/ip.d           |   1 -
> >   libdtrace/net.d          |   6 +-
> >   libdtrace/tcp.d          |  52 ++---
> >   35 files changed, 761 insertions(+), 267 deletions(-)
> >   create mode 100644 libdtrace/dt_prov_tcp.c
> > 
