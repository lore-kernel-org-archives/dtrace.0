Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0115A1D7995
	for <dtrace@lists.linux.dev>; Tue,  8 Jul 2025 01:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751938474; cv=fail; b=C9hh35OJBUgdCqmjbRcJVcwGo++nxiW/W9Twtj2vfTLzpJcHFcA+eEPT/YfxCEEjyzUcJ9gDKJN3fyZFWNVun7ut4JtnrNXC80y6LBvfmtT+cOQlsRw2DxJUQeNnl1W1q2NU8EVVaO7MWORhaaTg2WTU6cRsey4uAIe7ha/xGW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751938474; c=relaxed/simple;
	bh=c8I497CICEqlky0/TXuNW31UDVhGx5AM6Vyr4OE6aqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W/p+OPixWYVflclk/DWRlxU4rCG7NNrJUm4zFrVPYukt6iYeUL7U46z63V0Yd53w9IGHPcvDm1cAyScETtAdSsxbODfSLrgI5fgALe8GuT8/wihAK8dEP7bOtmD+78k3cgCvZkNaRvapFJNr0cNd4QqwjSK02olzq/uZEtWfHZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=boTdbdbV; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fw2RgbMD reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="boTdbdbV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fw2RgbMD"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567NquJw010105
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 01:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=eGumzhZkro74HVZi52vX1KUpX/UjFd71rL0anyuMwnQ=; b=
	boTdbdbVLRsVOE5agV1MmnGoYvGXQzZ6JJQtry6aFaonW+0/5qm9YpFcApWI1Rhu
	IXggbbKgY0Gt9BMqPRTSkRmTXM/bAltCyuI+mgjIgf1ZICKqN/EFBmFgipLvHMOT
	GXbKhhfE53OhuNzv6wWt4tVz6V5AeV7GNxBzYNuaUDiy0okDYyMNXEiwqwCPx9uA
	AbpyIdWjh289uOpY3+8C9gN9fp6wd6Xyr7cejWO745dkvovI50EQaioBm5ofEVbM
	YPG3ajdR6/VeJS6URGNSAvQAiT4gH1g3LL0qcD6osqKRoMnIiEWOCbJOgXtDapwm
	c8h7U9NiGDj9Pn6xXbqaqA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47rr9j8305-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 01:34:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56810gpd014241
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 01:34:30 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg902a1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 01:34:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLfpm1lXG3iaC+1Et5yEgdGojfcGeT/SW9q/mWDmPfWbK5QF2KW6nlJQ1JNrOOL0doxjzEJInzSc15lRxL7IhF5Ej8vU6mgPOOwPVwiFiLHp1qxrqBUjoOjYhfivkZ4QV6+r1gvAaMN7P+XKT99V3WhePbzfbavpRwJWkWGTLYh+mD5hn4zwcT9l6sUfP2fOfDZucUL2C3CygpvE4Y7vfc/PPmpppAgWHLSaXpeTt2e7QlpwS/Zvw+tli2jSdIhFRuG0431vEUQOZVjv1TU27NAal8jIBrU84LEeqDncICrC8iG31SPUv00fJmzi3FjQfThVeH83KYXBo6ozsBppAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgVWXsA1R1Eji5hj/HvVAWyvGk5W2boEDSZaY2G2whw=;
 b=a5nWf5QXr2ukpUOTgW+xOH+7STw+nWP3ogDAvWfpikjGJzZmRCG91Bf4C2npojJDoEKL59yTEZ/6CKBAZ/I1KO8tZ8h1H/OpKIvu0aQ1qc6Z4sn730Z13G39dQ5oe1eCbdg/7owbEl1GQgKgGhkZdoaTF/EfspNC7JkOwSs3rhCSqUnkH5aBh2d/rpcomyP9Y6rXPJm7duguXxWxdvPY9QBB3/jjVFhaKiC2qw/JL/aOCB+nmwO+fdcxnRqXbReall2kbxLLdGZwa5T+QG/0yr4gWPX5zTP6dBXoiqV2FbB7Z4NLktzI7MlqWwKnVUMKl5+arPvj0ARagTBhJAv0Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgVWXsA1R1Eji5hj/HvVAWyvGk5W2boEDSZaY2G2whw=;
 b=fw2RgbMDjspXpn6QPdIZ+XXLXpHhC56aYemAAYgSpcdRFymGskAuq+KHqA7GGvEjFXpcXF4ufZZ0ZB4QIP7bPP6s+t3IET0AYQzM23Y7hFonG/rhMZa2dyEDiWE3BwzVBWwzuCz+ZpgADm9iQg2qWObFxvrhI7advR/BZSvu0rE=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM3PPFEC98198CD.namprd10.prod.outlook.com (2603:10b6:f:fc00::c55) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 01:34:26 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 8 Jul 2025
 01:34:26 +0000
Date: Mon, 7 Jul 2025 21:34:23 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
Message-ID: <aGx1n+VfTcUaHIq6@oracle.com>
References: <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
 <aGbT+p0DjRTFl7Oc@oracle.com>
 <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
 <aGbvQAmqsLA5+LaH@oracle.com>
 <aGcF67vQ8M942gh0@oracle.com>
 <21b12943-a166-41f4-8f30-8bb44e12317a@oracle.com>
 <aGv7kQqlPZt6Kmw6@oracle.com>
 <d74b40a6-0834-4edb-8cf9-dac28500a7cb@oracle.com>
 <aGwmKfOPU+NZ+ekf@oracle.com>
 <a2c14fbc-ac46-4e0b-804e-fb6e6c3e0751@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2c14fbc-ac46-4e0b-804e-fb6e6c3e0751@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM3PPFEC98198CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3a1080-1b7d-41ce-0f43-08ddbdbf9353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?PsURWE3wkyW9z4ZMREhELefJHB3ARnBnZgpd4Wx+QvjsP0IRz6W9AZdpOL?=
 =?iso-8859-1?Q?R0anoweyFg9W2U2tj5SaeTh7ll9AczPc8vzftt+/qHTFyVWcJhTdf3N/YE?=
 =?iso-8859-1?Q?3XnuW9a8W3Nn3Cfu6DSUXYAey3gDVao+fWWA8okoW745dAkvIMzRnaOoSA?=
 =?iso-8859-1?Q?cguNVp31HyzvPcv1nbU2dgoCad90JzvE3zS97DcHJgBn5wAhUMXVeaowJJ?=
 =?iso-8859-1?Q?un7vbCDSA1+L2P4BdfHetORO/KilBwQw/6+uFkZpIZ3YaNEabQzv6+8scj?=
 =?iso-8859-1?Q?3IJoscz3g+yHNIr4iclE2jOgxMsOjRAgLUwN1vEQCcWWFPNEKtnueUheN6?=
 =?iso-8859-1?Q?6NGizPr53V6aREH3BLauXOvIwzYzJQLG0MtiOu6v2KRWdvWWd52QSZTpLA?=
 =?iso-8859-1?Q?z1OqFNh+wsBhH4n3P4HmWZxYGfqzKfCaOTq7p3lCD7M+sFYWlT2Fo1VBTu?=
 =?iso-8859-1?Q?Nph3t8UzR1Tam6erlLqRITX2MayHUq0IE+m97/a9n2GWvJVmEpsdLifRKh?=
 =?iso-8859-1?Q?p7EFXs5lgVb7kPoBU/tk2m7pou5iWkvHY2XJhLgfCdEUyzEgctk4LXfnez?=
 =?iso-8859-1?Q?RDt1EgzuNBiy9g4UTR0hog4QwUEyppWUiymi1qFv9DIo0t3kypajVN4nTH?=
 =?iso-8859-1?Q?ZuEoBj8O03PfKr5k9Drmd/ZvsblpE4nngIKEu9s81GOM3N0zoEu3SZUsvG?=
 =?iso-8859-1?Q?dBCsPETU0eMtcTO99bI6bsrbdyJyjsEAg25lZnCcmfPJAIY92hGDUiX9kW?=
 =?iso-8859-1?Q?vWPaaKuIerweWk3XV9C/U91VrvkKctWf1JTJrsg+AJySvIa3wH9xnma3t/?=
 =?iso-8859-1?Q?8X4n+TZnEhtEanSaOXjd7bktiHVtDNaQLlmkhgEoRBWrxNoX0lQJgWBk31?=
 =?iso-8859-1?Q?gNrzDbYB8k+fRVd9yIHV0n8Pz73b9pSWX8E/uuF6lgRU1a3fUElvfR9eCj?=
 =?iso-8859-1?Q?pp2sH9//CGHAyR0au5VYB8TweaqnbsuuKtP1UoIxdVRvxaw3BTjDyM44B7?=
 =?iso-8859-1?Q?VPIBo0srrTKj5KavRfLnafCSg00HQwklDQZN3oiwBajGEUFRfx+VrQZsvX?=
 =?iso-8859-1?Q?rvXCrsMn0GstC9/hzZVXE5zmzCpa1Y7wOX1XKwERfDcCtERVSiEzfaPDeW?=
 =?iso-8859-1?Q?zrprfqSjVVNn5Y9dRfVz04FqAOjQcHoTUOgRrQGpcr5ydI+13PDLzN9osL?=
 =?iso-8859-1?Q?xKWslWlKpgEgy+gnIeDYwiKCT5VDfj+mkvi7lucKHkVzpwa38kT7SyZsZ9?=
 =?iso-8859-1?Q?1KujMz9pvkB3jfT5C7YivWIF9HXW4El1wxgN9QpnZ343Xz2JSteZoS1Ufu?=
 =?iso-8859-1?Q?CCSLyWFqp/jYGK62Vd2EE0UrkPvoAYF56GJSk9sxF+V1uWb1CZh2N/dK4C?=
 =?iso-8859-1?Q?GU1DGFAOCRREpn/XmMd30dAGnE2o83SZy1BB5pCuNUJfulArZGRScq9gP5?=
 =?iso-8859-1?Q?sAYGpDfTjlZhMcXb34FudcqS9Iu8iTWnTZmf2fvoAfc9GZVK9ZH9umIv5y?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?bwI4ngYwBKPiTIfKMljveQ50TNXMBbazQB5faXm3gXtpQ8kLvpldBU2OmV?=
 =?iso-8859-1?Q?Bud7ACbkgFW5tCF/tjNg/GYE5FLdUXeGw9juiWciiECldKohXDeYvjrY46?=
 =?iso-8859-1?Q?1h1WoKKgZUuN50EysfHOcFk0cuvA7FAGY/AjSBYBkstbdA2S2Psg/EQYQv?=
 =?iso-8859-1?Q?h5UTDr+NHanIQ1F/5Zojet6a8GLFevPoz7v124mkFfqqZfCAXc0Ey0mkXC?=
 =?iso-8859-1?Q?8ZXqZ+nP2NYgC6yIBEHkjKgnK0VjTM/S6EAxaUyFh34pG7Q3bHAV7xVaSi?=
 =?iso-8859-1?Q?5RWMhtItNqOwklkLhKHoo5D7jLhLV6sUjdlMWpaQbaZ3/DsCmn7SiNgaRg?=
 =?iso-8859-1?Q?mJUsdoBIBt5mmQTn0TP4Rjw9KA2NR2fbtYoloHpnz8XT9oxK0eTM2g76sy?=
 =?iso-8859-1?Q?VVnQjdbESbHNOjjICoyQhEqW8CqHJm+PjwQdVgNa2+cNtIJPxVUOStEva0?=
 =?iso-8859-1?Q?eUlNmMp7um1i71kiP8MIUNw/FY99pz+cBSvH7R6lzMAAMKWQTZ2CJCLyh/?=
 =?iso-8859-1?Q?wiiF1zV+gv8jfcKoYg5luui8G2e4zePMnLYwBrkhM12mOnX2/cVcYPIC6N?=
 =?iso-8859-1?Q?/4PeOYiqEvZZKHQy2lo9lFl1OPBaY1Rk4MNolXdnDFHMCo1iAo/uikDY2u?=
 =?iso-8859-1?Q?nJizbAqQUeKotMqLk48HXMzDw9VOWH0YakHQvd+gUP3QEHhchz1Wc4v20k?=
 =?iso-8859-1?Q?ezxrC72wdw8gubMHXyqFGOa1ZznUBi2bfDOr9IPqvq2TK7N+X9tkdq7PQU?=
 =?iso-8859-1?Q?Op1BHj9NdPzqdyVPHpiN2nZJOwbvqH5allIDVR4polflYHbw5nD7G3+znE?=
 =?iso-8859-1?Q?3u3PXFfzpAQ3OY6GVVDF9FeeRhVWZxQBGGLTAGnMmSOg9nvRbKk3sioohy?=
 =?iso-8859-1?Q?gaDccyTcP0nNg52y0weIdtloaiH2tmLx0A6tc186QwoMr1LRE8S0EmgDO7?=
 =?iso-8859-1?Q?ejtqFYLpmi4yv7y/CgxvLmFGUFtfdUnhkDov7gMnPFOm47a/dwDfpyphwT?=
 =?iso-8859-1?Q?FalSP4tO4wSaW9uFOG444LwYvlGRsNkCHqwL+SitGUjHurzcNqXKrG/fPF?=
 =?iso-8859-1?Q?O82McFrgJOkb14d5rufw6TItHZ3ajSd8CoUC0yP3qPnXTHKiG+5XX1r57O?=
 =?iso-8859-1?Q?Apz/vPRajqwduDf45yVTevMalJn/+QUMihkdVErthG0Jj2wj36TjYJK6+e?=
 =?iso-8859-1?Q?qVVKBaj06Eh7RzMG1OouDimYFtCfN5UyBeLCVti+Z5T8FiGeqP+kNz5PsW?=
 =?iso-8859-1?Q?7QR9py328Vl31A9HEKtYlZaLub/qulMStoeC6TpPLqaYCizPLBWMm2m/pl?=
 =?iso-8859-1?Q?UoS4i/+aezi1Fx94lFc+eFa27OLLsODM3bRaXZFuYWz+0Dftuk6146t4+/?=
 =?iso-8859-1?Q?R57X5fvmTfjpPFrjiFHjPdsyp6HYI5CvMaMFS9wRsTi9Gk0NRCylk3AHxD?=
 =?iso-8859-1?Q?VkF4zL1JnWkMdwo/jKrOmT5SPRZa2sS6UTja97CNbVAE+DRq54RK6tUZ54?=
 =?iso-8859-1?Q?Jk8XTXguriTEVATeqru70EZpkYt3qbabVKHPCSY8iw7fVjRyZIN/ewJ6r0?=
 =?iso-8859-1?Q?4cXg++PbFusxQnDpoFrXqRQiXS1VTuH8HgshTrlZi6w5H8KlsqDhTSEeOY?=
 =?iso-8859-1?Q?MHUlX4hajzlquTdFa+p+70C9uc6xcHtn4QO0C+Ipjaj0Fu9cHk6rDIwQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BI/dsmVpn1gVlKmRVPNFSSRPXpRcsKDJL5ZAlU1d7rfVNkwCaibZ+il47rbwcCHe0xxOeJbr6kCw8XzB72nutut3FJ4zaC44CE6V2MTN/wYASRLaJJMCC3NktpaLeezs98vGi4dW/DCFc3vXeUW4lY+EwomsZPOYqQjtL+XoGqhWD8NDvkPn2ct/p6lWcOV7JizygPVAiPzxHX3aYv4VKuASyUxGreNtS6CEOGfTUrn0CjeK4OCLrSmxr6yn2xhDwAjAEcHDPqx4q0CDY8/zcz2B+57A6F/N6cg8mV/+/YyAHpu0J5CdzZvUs2lEtvOlSyqhzl+JrA14jo1vhZK9AKK6vwD1i2WmDOGGoB4J/DgDLiWII/p6Qd/JQHY2UHflANsD0N4q+j41uE1Rv2zHx94qdA61c0EVY/HzcO06JGA/URVyTeD61sD75Wsv2I39l8+ycPM0NXcMHCGt4lT7mD+754d5aJk8ANk/DtsVIlZpaDRg1dUdepgR8ulXwSSpVDFGVZrYOOLxwXIj2/vSvQZQuLAiP7Bb60VSz2WYjunLSDqMtdNVU5y+e5Rni/Ebqq2mHUrCZMmRw+v5LBGg305xZUgKDEQYVVuXtxYeU10=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3a1080-1b7d-41ce-0f43-08ddbdbf9353
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 01:34:26.6194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4Slhk2knRKwy9/o5ZuP+xyR9Mh17gsHz5T1Rb4AuZf7pCRJXzrUQiO476FRtUoV+jFBVQ1avkayDrqZV6zdtJa3JZNf4XZ2TnmO2nJJvDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEC98198CD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507080011
X-Proofpoint-ORIG-GUID: eNQ_9MuHwWArNRmrJwJHWJvthGtSwz0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAxMSBTYWx0ZWRfXx+tFv0xokyS/ E+S2lK/hkaEQp60D4q9agZmHG6QCpHEogRzo2tDe+tLwTu2BJys5v5kkzcjErUhq1JGQDGWqWBQ MFuRYjs/SIsGmdYwgWlObPhBeCkc88/sgFYKb5ndo038LhvUBzXTP5Zv+H95Fy4/c2rwd8QC8fY
 +AHXno/DYdHKlDSgU9HbFWI5oXt5XdJnf9OEcl1/mr9QYoxz0iQUDcm2EloLARa+neJMWcM+NSc DqPji6H70bTWMMNwYWPyGKhWXN5XKk809ulEFLV2NGREgPlS3h0E4z/Q2ktnHJjcHbCsgmjynHH 7Qy4QOmy9+d5DkuUE2q7BCozw5PIxF8ltc+hDC5KSUVjn5Z8IuHIVSna7kZ0aSWtMGg3EWHUXYu
 vl1PmISxRBIjzEldVcK2drB+gmzyvyh5vVH7bLaU+AG3Uh5sfNincL5eHoITe/TNiRW8MDoE
X-Authority-Analysis: v=2.4 cv=G68cE8k5 c=1 sm=1 tr=0 ts=686c75a7 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=DG9I4XOtvST1xFzAU28A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12058
X-Proofpoint-GUID: eNQ_9MuHwWArNRmrJwJHWJvthGtSwz0s

On Mon, Jul 07, 2025 at 10:51:10PM +0100, Alan Maguire wrote:
> On 07/07/2025 20:55, Kris Van Hees wrote:
> > On Mon, Jul 07, 2025 at 07:14:35PM +0100, Alan Maguire wrote:
> >> On 07/07/2025 17:53, Kris Van Hees wrote:
> >>> On Mon, Jul 07, 2025 at 05:32:19PM +0100, Alan Maguire wrote:
> >>>> On 03/07/2025 23:36, Kris Van Hees wrote:
> >>>>> On Thu, Jul 03, 2025 at 04:59:44PM -0400, Kris Van Hees wrote:
> >>>>>> On Thu, Jul 03, 2025 at 09:23:46PM +0100, Alan Maguire wrote:
> >>>>>>> On 03/07/2025 20:03, Kris Van Hees wrote:
> >>>>>>>> On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
> >>>>>>>>> On 03/07/2025 19:26, Kris Van Hees wrote:
> >>>>>>>>>> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
> >>>>>>>>>>> On 03/07/2025 18:06, Eugene Loh wrote:
> >>>>>>>>>>>> On 7/3/25 12:59, Alan Maguire wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>>> On 03/07/2025 17:43, Eugene Loh wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
> >>>>>>>>>>>>>> patch 3/4 feedback).
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
> >>>>>>>>>>>>> send probes?
> >>>>>>>>>>>>
> >>>>>>>>>>>>     dtrace: failed to compile script /dev/stdin:
> >>>>>>>>>>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
> >>>>>>>>>>>> inet_ntoa arg#1 (ipaddr_t *):
> >>>>>>>>>>>>     Unknown type name
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Ah, sorry yep I have a fix for that one in the next round. Basically we
> >>>>>>>>>>> need to add it to the core set of typedefs and add a type for a pointer
> >>>>>>>>>>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
> >>>>>>>>>>
> >>>>>>>>>> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
> >>>>>>>>>> this I believe?
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Unfortunately the #pragma include doesn't do enough; it just defines a
> >>>>>>>>> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
> >>>>>>>>> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
> >>>>>>>>> typedef to net.d and doing the pointer lookup/addition but that doesn't
> >>>>>>>>> work either. Seems we need the core typedef + pointer addition or we hit
> >>>>>>>>> this failure.
> >>>>>>>>
> >>>>>>>> Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
> >>>>>>>> you should be set.  That is what I did in my priliminary tcp provider impl.
> >>>>>>>> I do believe that works.  Either way, we use inet_ntoa() in the ip.d
> >>>>>>>> translators and that works with that typedef in the file, so this really ought
> >>>>>>>> to work.
> >>>>>>
> >>>>>>> Yep, I tried that in the v2 patch series; Eugene hit the undefined error
> >>>>>>> in one test and I now hit it consistently for all tcp/ip tests
> >>>>>>> unfortunately with "typedef __be32 ipaddr_t;" in net.d.
> >>>>>>>
> >>>>>>> My assumption (probably wrong) is that the include of the library does
> >>>>>>> happen but nothing triggers the pointer type generation for "ipaddr *"
> >>>>>>> in the CTF dict. If there was a way to force that type generation at the
> >>>>>>> .d file level that would be great, not sure I see a way currently tho.
> >>>>>>
> >>>>>> Well, like I said, it does work for ip.d so I don't see why this would be
> >>>>>> any different.  I'll have a look and see if I can figure something out.
> >>>>>
> >>>>> Looking into this more, I think the problem is simply that you did not sync
> >>>>> all the dlibs for the various kernel versions with the updated ip.d, net.d, and
> >>>>> tcp.d files.  So, if the kernel on the OL8 instance you test on does not have
> >>>>> your change, it will fail.
> >>>>>
> >>>>
> >>>> No, don't think that's it; the .d files that matched the kernel I tested
> >>>> on (6.10) were synced; the use of the 6.10 .d files was visible in the
> >>>> error message. The problem appears to be around the fact that tcp.d uses
> >>>> the ipaddr_t * in inet_ntoa(), but unlike ip.d (which uses ipaddr_t in
> >>>> translated types) it does not have any other mention of ipaddr_t.
> >>>> Adding an explicit cast in tcp.d to the argument to inet_ntoa() to
> >>>> ipaddr_t * resolves the issue without having to add ipaddr_t to the core
> >>>> type list.
> >>>
> >>> Can you reproduce this at will?  Can you give me specifics on OL version,
> >>> kernel version, etc?  I'd like to be able to reproduce what you see, because
> >>> so far, all I tried actually works once the ipaddr_t typedef is in net.d.
> >>>
> >>
> >> Yep, it's 100% reproducible for me on an upstream (bpf-next 6.15) kernel
> >> + OL9. Moving ipaddr_t to net.d works for ip.d but not tcp.d in that
> >> environment. The extra casts for the inet_ntoa() parameters that I
> >> mention above are needed in tcp.d to get things to work properly for me.
> >>
> >> I pushed a branch to
> >>
> >> https://github.com/alan-maguire/dtrace-utils/tree/remote-tcp-v3-wip-broken
> >>
> >> that illustrates the failure.
> >>
> >> Relative to devel, it consists of 6 commits
> >>
> >> 1: the v2 of the remote IP address change (ensuring the remote address
> >> tests won't fail);
> >> 2-4: a few prep patches for the tcp provider; and
> >> 5: the tcp provider patch (in a v3 work-in-progress form); and finally
> >> 6: the top-level commit then removes the casts I added to tcp.d in the
> >> previous "tcp: new provider" commit. With that change in place on my
> >> system, the previously-passing IP tests start failing.
> >>
> >> If I "git reset --hard HEAD~1" on that branch (reestablishing those
> >> ipaddr_t * casts) and rebuild, the failures go away for me.
> > 
> > I tested your tree on Debian with the 6.15 kernel, and this is the result:
> > 
> > $ uname -a
> > Linux kvh-deb-bpf3 6.15.0 #1 SMP PREEMPT_DYNAMIC Mon Jul  7 15:19:59 EDT 2025 x86_64 GNU/Linux
> > $ cat test/log/current/runtest.sum 
> > dtrace: Oracle D 2.0
> > This is DTrace 2.0.1
> > dtrace(1) version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
> > libdtrace version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
> > Linux kvh-deb-bpf3 6.15.0 #1 SMP PREEMPT_DYNAMIC Mon Jul  7 15:19:59 EDT 2025 x86_64 GNU/Linux
> > testsuite version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
> > 
> > test/unittest/tcp/tst.ipv4localtcp.sh: PASS.
> > test/unittest/tcp/tst.ipv4localtcpstate.sh: PASS.
> > test/unittest/tcp/tst.ipv4remotetcp.sh: PASS.
> > test/unittest/tcp/tst.ipv4remotetcpstate.sh: PASS.
> > test/unittest/tcp/tst.ipv6localtcp.sh: PASS.
> > test/unittest/tcp/tst.ipv6localtcpstate.sh: PASS.
> > 6 cases (6 PASS, 0 FAIL, 0 XPASS, 0 XFAIL, 0 SKIP)
> > 
> > I will try to get 6.15 on an OL9 instance and try there, but either way, I
> > have a feeling there is a binutils (libctf) discrepancy somewhere?  What
> 
> could be; see below..
> 
> > version of binutils is installed on your system (nm -V)?
> 
> $ nm -V
> GNU nm version 2.35.2-42.0.1.el9
> Copyright (C) 2020 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public License version 3 or (at your option) any later
> version.
> This program has absolutely no warranty.
> 
> Let me know if you need any more info. Thanks!
> 
> Alan


Tried it on OL9 with 6.15.4 kernel, and aside from some probes not firing,
the tests work.

$ nm -V
GNU nm version 2.35.2-63.0.1.el9
Copyright (C) 2020 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or (at your option) any later version.
This program has absolutely no warranty.

So I think you need to yum update your system?
