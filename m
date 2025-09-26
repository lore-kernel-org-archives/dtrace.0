Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143A6221F2D
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913590; cv=fail; b=JA6xvuz/0e2C+PzSauxS/4yBdv9jQ8xW9Bv/6fiv0wfqTlsLslU0aAXzPUfId+A1K9E7tSxB7TvDxM4rqTtr9YPj7Wa8gTW64OeVUlkcQY4cExs0tSO8F2hPjN1vsM/MMyPZ6dW7QWTr0kA8OlqtXqiD3mVYN62uKzF9GnbG7e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913590; c=relaxed/simple;
	bh=+qtHjVseYnDGP8+L439mg/HUBjOa8dtLMKTGHv7qmMU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fbglfEzapmODeIQlK8EVNItO+x2ebMLwxq6Sa2qGA0gu81K14rX+7Mvrf2/Ilj8JIFt4jUZ0m8+R9HjYy8rO52U9JrbugOHHjPgbXE3/AVuobwZ4LIN3WrK6ZLYqBius1tX4MSzJhPaAjjCS4hHpl2/UXCmR7huTUGnwud0gx9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=grtTj83+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rWCqrU4x; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="grtTj83+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rWCqrU4x"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QINbAt006822
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=lmAxmjCU5U6/BQdpI1
	TksvmuIBxAJQsL/aLkZuVwg2Q=; b=grtTj83+n47ryObf7DMJ66Pel1+A2m/xOD
	1KCoL2mqDdZ3vtiSC11peIv1BI/wofpJAWTAMV6f07/3SfkzmpjisTkeJGxqGv9Z
	JEdZI3m1Hh9mQp+pEG+NSp7rnmalTHHJEAGOeSqJYrwP2rNuvYuuY4lpaCQp8WwN
	V36CCS+8lbPN/v/l2838DPpBsTp4JnxIsiSahMUc6aC/TMoWZL7DNLupUHsjoMtv
	aWPExWZfjzAtpNWq+hhMRpSVVDVomCH3M+S504EjTGHDoMNnbr1wyYA2fMJHCkUD
	BIGU394mLf6jS7czzYRH3+iugcExrWvjeZo+h1gJg/12pkwnEJEg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dw5a8efm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIYblk034860
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:27 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011039.outbound.protection.outlook.com [52.101.57.39])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49dd9uppyr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odrquvNVBPA5HxQiDTAWTplRdDANheVtTS902FskrhYVeLi9Ge6t0/IxJlt+OLNpKd2eWP5allZ8/TcD/1JjR9XDdrByVdOjiRcMwLJc1sPsCd6GaS26RpOW7ELy1dIkR6Kdh2LdccnRJyxsw4te1y03XHU1b33zyaU4jqOqShnyE0KiQOtqy0SuCBbpJottV6kf9eSLzu2h5sWt0nKnz7rh4PBMms6d3/QfP+dGrLqLwRbvKl6zA7wf73wByX4thF1JaGM7NUzyo0fkYS3j9fcxyD6CNTQUh7y3F4Ajlebjl3cC6uoEt9IWiWXXdXbDxadfsHLHZD+KHfhJeL0wkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmAxmjCU5U6/BQdpI1TksvmuIBxAJQsL/aLkZuVwg2Q=;
 b=XxXBOnRdebQSRgFLXZYj6LLQZeALA8ljofsl6ESbXIWhYM7CGJ+I4srDS6S6IayaSG9tLqmiTylr0A4Lob503sBe+Q+Ro4Cg1d+287ZvaqnZIaoT43vyX7u6AYQopjPcYKTwvih/FGWVZ5+8mLAZWeMAiyV739eNgmyY7AFhQHyfeWnUajkXWdaKoGusW4ZPe3SvS5d5GtIonTNViaOCsHHUQ7Lxq2pFTHxoY3B2J54FJwHNJUibTJxbeaNvHSMVJTpOnzx25pmZ3wTwGhL734Dby72xlYO/FUamFV9hs2pOfMqVLGMlcB9hWNfy1aC7s+qTHhpPPMB2684RgAtGxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmAxmjCU5U6/BQdpI1TksvmuIBxAJQsL/aLkZuVwg2Q=;
 b=rWCqrU4xyBJ4H92KwEYC+EMySQcCM6g9WXfMnoyp96OeQefPolEUOX+FHNDYGi3dcRg6u/pD8qbfex5GkahNOnyfxL+TwV364DaM5XXWJtTMY4vDFoJjEq7A+jvx5Z0xMKOV+n6GRI/+6qVkoyRnKhZqctYR48WAmyliFgVq+Wc=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BN0PR10MB4856.namprd10.prod.outlook.com (2603:10b6:408:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 19:06:23 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:23 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 16/20] doc: Clean up undefined anchor links
Date: Fri, 26 Sep 2025 15:05:53 -0400
Message-Id: <20250926190557.8485-16-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BN0PR10MB4856:EE_
X-MS-Office365-Filtering-Correlation-Id: 429af0cf-f058-4175-e056-08ddfd2fc8e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SFLSdTLsJfvY4cYpwOPx705eU+ufmYAHmXPELvtp22oqWg/CY3LAZCnjnv4w?=
 =?us-ascii?Q?ERQl9ej3Lb2VE1H7h+UfKQQDSCMGFP6I7SmXSQEHiE/L6q56otWQqtg1e7kg?=
 =?us-ascii?Q?XR3YqZ4Szjj78S7b6pSX/XH4BJu8QzUqUUK4e34gkrchI/0LsFMO4wF2C6PR?=
 =?us-ascii?Q?Rn0MO5sTL8LAGiJsSjucadpdTyCnDvgmB4v8RSi4dVDWTZ7kHCXKE4NQ0pTV?=
 =?us-ascii?Q?EmGrSsp0gjxJnCoPtGPj/HdNStBTdPoUq3apXC7Xjm+3+DGEsKMab7xdARr+?=
 =?us-ascii?Q?atXFuJ/c2N2FPRyoF4gxZ/50xOw8FMVypAMTRl1S7ze5DVgTwuOELbBxinmd?=
 =?us-ascii?Q?oA87ho5QJL+zYoMMHX5v/wCNCkLWEzbv7egkrcqML15vMHEdQzChcOABL8Eu?=
 =?us-ascii?Q?K+fFxu7sN5WtV8Xtusx10YIbYLk+R511tyhV9+Vu2FX+A6YNzk263Nsly8Hq?=
 =?us-ascii?Q?LbR5ot6WbKCAhn9r5BKKhxfcBDA2AdSmBxahBh1PQPNFwSGEGowUo37KvuTK?=
 =?us-ascii?Q?C4uzhgYBpwOFTRqNthP+79LBpo6BF032oya5BktTw/0seQbbDDKjWS6FHIan?=
 =?us-ascii?Q?rfCtS0zIitHxr5lZZM23WFhenVjyjtVSC2GarKwigJxX5hi09TzzudjJURZY?=
 =?us-ascii?Q?Y0m98V/Wd2xJC6+NLXybKNhKd+aqtKCn7sa8iP/SJ9gCb0DW2KiTWxwxSxvx?=
 =?us-ascii?Q?S0uE3d4rNbLn0WRAnvX7owV1m+8aM3GQqysPrNGmQ6DH6atirN6xeJwIonL9?=
 =?us-ascii?Q?mMdsK//yRGOCl2IKgjzUwyVohoLcIPyj6gob7Xj2QkS9GZhitvYCEbT+tqMK?=
 =?us-ascii?Q?qPGLsDOZAcN31lSxYDej7/XofkaNBhM2mW3hwtXEiNIoUlsiRQjAVt8GQBLE?=
 =?us-ascii?Q?qv7Sgxv6JZcCNDt3IJIX0SmgB38nl+rgQH5V6gDe/J0NoiBB8zo1HdzJ10FM?=
 =?us-ascii?Q?TWL3taqmy4rtBIRrkPqomWKJaZtqu5POnyMHnTrjk40CNa7s+xV6rnmejQT6?=
 =?us-ascii?Q?Y6kV9nNd4bITpdUrkTHx7OqJKSuZa914j5IzCOf3ShV2M8hw/ljBQTmvI5f+?=
 =?us-ascii?Q?ZadoWbHKddtOIiz9PWIVTwG2Up2rGIrYk4So0dgz3NHfmu6AoW3qjNDLWLku?=
 =?us-ascii?Q?FVqwakqmnwK1CK/xuh8m4YFOuhPAQOk+Wni68RaC6NbP13g0AVzUPpgAO0RM?=
 =?us-ascii?Q?kIttsjROEoQ8V6gkc5F4vFngqXjedFCY+RXkUhUsGNd5yrNgTlWR0+c8/9eg?=
 =?us-ascii?Q?I9lPGZSRdX32otHp1RFSjVlHvGt8ioa7XzBdw6RZgShtbYK6aSbBsKrmWuOH?=
 =?us-ascii?Q?LVpiGJmMx2SvVVk3TQGk0m8BtUuTI3JOU6youSugWX9cAB1BOYsoudacoVOl?=
 =?us-ascii?Q?b+gMi6YVGH9U718wp1K3pwbXTGESUePYhcKL3JahZ/aKTkg7g/KxyXsXsS3c?=
 =?us-ascii?Q?HlVuKDvHj6aPKLY6ZPDdqwTCLphiceTo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bN0gC/0sN/HzZ1/Ym5Iz4/5f0kJhL0BmEkrLRIB2n25fZSIY0VLkkVvLd1QQ?=
 =?us-ascii?Q?FZ8duBeb2LBQDjWdHp+Ijpujnh26/OyS7ff/bXg8cjBo945njthmpmCJEpOc?=
 =?us-ascii?Q?olGSjh11+vD5ZrUCQfjnve+jeMfNBD0DqYE4xid/jGLCWCe6Kzq3pL9zVSC/?=
 =?us-ascii?Q?Tm9KOt9O/Q5Qj4yvQjUIZdo7cpe4BQ4Yp5Cg9bR5Fy48d0iAaOwt0GR7Gmlp?=
 =?us-ascii?Q?i+SIfByDdQNLW1Kc2ZJsF+1Kv9ZGvzJStufXdvHrgZFPicUM+I2Q+J32DaZg?=
 =?us-ascii?Q?VIDKmdaetwCLk8qq4DYXDxGNLKzTjo3O3AiIRqKiOoB/Noc0CFBcGAhRC0PC?=
 =?us-ascii?Q?jRiLEjXi2Hmf887EO4y+IjVm1GOcRVI8yb3XtBT7z9euzje6ZlkcZOHO4ru8?=
 =?us-ascii?Q?E8XKWOQ+eUByWIoI05N23ugP/85zHim7YqWVcA4mo3ra9eADvUjvNIoFqBbh?=
 =?us-ascii?Q?xq23SBpGk82gCKQO1mamrhEhX6DI+5mYHk6Xy9IhSsFZLaWzwFdO3Eei+CWL?=
 =?us-ascii?Q?ZNU+HmSbGUJ9cBw/24yJgRTeemCmbHnKUUaFbSb6atWJTf826I03Z0Aj51zT?=
 =?us-ascii?Q?7X8b6zlScAMbo0S96sDr2GjrX11k/yuNAgez4ruDpjcWHQ1nWrOg5OWl+2Qh?=
 =?us-ascii?Q?N9lUvJSJT6VsrwpSrUGnTZwKcO1H/QMcc3HSJ+N/GQU4ICcZTEW4Ncy/+4vn?=
 =?us-ascii?Q?p5SOOvME7IZN1XQ7aBycUL2cNrOiMDXjpHcU9CexGw0GewQrB921Nj+6raAL?=
 =?us-ascii?Q?T04DyH1oq16cJE1lb3AQ4R4a9JzyUBotwrxRT/aIIl4AOl4bOO4nt4No537u?=
 =?us-ascii?Q?7Bidk3yiBDKG4Iab9vfx7MG9dkUSf7g57FNNZDz+/YOUZl+XjFs2kKkJOaHp?=
 =?us-ascii?Q?Wt0XqyrhSxZergaN4CnOYU/S0I0n8PtWeRadEZYIrh7yxEDIMbKXkMXJvJY1?=
 =?us-ascii?Q?kqhtXdRA5ilB9Iyy2QOsG8AiPEaxfrSLPu3PDAScHs62vISVIgHgOgb5gnHF?=
 =?us-ascii?Q?0g7g0gjCUQDSEnVdkaOKrH5YZTr9q0KDpVJixEAYL7s440/W+BA/3N1kVcWY?=
 =?us-ascii?Q?Epwg58/kXUXPRQI7+FBfpJ+HlIqXVP7oVpV6H02R0Mw+j/mbQM3NkQmedr+M?=
 =?us-ascii?Q?NA9QieV4kkj191Rw0iEiIIqapVECk4KTuOUKZ9AM0wNmAkozzd4cItKJ3ZIG?=
 =?us-ascii?Q?suBl8U1zrQtrNxr6rqBHUl1vWXVz0lJUn9oApvQjOMGzkpBf6507T+H2CXk8?=
 =?us-ascii?Q?65RM5Mz358MsvD9GvejcNfo6J4+ycBg+uaQEeXs16+9/uQHtte1afgWm1FHW?=
 =?us-ascii?Q?6b0h8x5kORxolcIU/WD1DuI4s+Y6HtHKwldhdb2jhjHsjeBa2PDa0vzlm9xQ?=
 =?us-ascii?Q?X3QnH3G2Xb0RUtp8r657Fq63ykor8xngOne9lP2d+0vNIVJmnULQqEnLHjeS?=
 =?us-ascii?Q?PghGwNd+aLU8rr2DkuA/+BOBNo23xpSfZRhLKkMoIu4HvIeGat8YkzxXHC7i?=
 =?us-ascii?Q?dm8jbFlz+0UGCwqZlpgmZkbDiZT+dg1chSCWZuMjG9+cAHo7QGXcwfMl0iIf?=
 =?us-ascii?Q?rMgnXjEPLX7+urKLMkqcREc2Ao8+3B5xgLSmJU++?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IyHvkGuiqWpM/8s1ecKN7B1QJYlUZaUWhNeJNDy5AzjtpW1/g+uagLB7hE74wxJGIBwfEyg7LXdFW3F3w7aC6yrZ/F1GZSsj1EZ+BJKAprr4j8di2JkOflSnhxdb/yP33wfRBSTWc3u5zVdMbLMnBiQlDEuATi3h4WgYqAKIeiqt6yPRE1tpVupIdEVmd3hlSZccwie2z0VxY5zl37RDxh/K2Jo67+Mp/hnrPXRW9VlMoSP3HsFB5QRj9ytUrdy/BmJtpmQEvb4LDrTAQAb7U/m059gK11vUIRT05sdjWCm0BVoQr1HLBR44LTAcWy6HP+e6pHHVcnKYHtuHR6T1GTRuLX7LSjoO/ZgQnYCgkB/KcRpdaM/VwXaToJwVEbP8iTuLAFpefCpIy/zuCiQrPlnQ9zsVeDFhl1NAIJsdmf3y74gfq7QzZr5+oiR4glxOJH7lhcmVkRXWSlg3lw6xvBW/joSsTB9QeodINbZxwRJ84wi2yMDHaYx/jIrRLc5VENpxfGLBaSTxB9wgMnUJO6IFdaIuRKxdt7WLr6Yvekf7vPG/Ojuf43UNX/LO2pDUgoW/LKdBdm/lc7odu2Xf9O3NBKkYCfifrx9dbEAx89E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429af0cf-f058-4175-e056-08ddfd2fc8e5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:23.3478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzKhZZfPosSRn/7m1ze/hTaYvbad6NqL6sEeTrOpjHG/2i4BqkIDcB/uBLZ6YLAEHGoH3+n2rHrzjR3p+tm3MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEzOCBTYWx0ZWRfX7snZxH+pI0P3
 Hgm9hEHo9JzOeNJIjKMIvrpmpa/bmeGe7es7LeIdgvKasL+sQJIoABst2jCbLXNvJ5i92gqWKSy
 UGZ4sSbs0kBDr+9vitkR/mXsf9hNdlyE5t25J3rnZamM+OM5H0H0r/GXtBEj1fyYmrXxbXaB60G
 JdOVsktQ74KVx9w8KYztOIYKoQxc3uh7zhFtL/kD4UqoVmIzbxA0FHVkI/3EYSZqN3FAsWNVbH9
 gkHrkS0Pl+HEqLk2Bc+Fi6tufK0WKimENlTVSRarhUflU6mQzom5u8qJzsujqKZ8Ifc7cmPdns4
 oaehS7/DSw8RxTBTYrh5APpaE17UoXtylcuZf3R081eE4W0a67mV+83a9HCWoa6kOKff8yinkjI
 29CUlMd6tYDUh5HuhX48X/xsLRJyzH9wJOUSwqkQI8R6YD8I61o=
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=68d6e434 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=mxRxPJFcLYzrWtplIzoA:9 cc=ntf
 awl=host:13622
X-Proofpoint-GUID: oMcl7ddBiIpxZE_o6Tge9AuY2oQIRwra
X-Proofpoint-ORIG-GUID: oMcl7ddBiIpxZE_o6Tge9AuY2oQIRwra

From: Eugene Loh <eugene.loh@oracle.com>

These anchor IDs were never defined, but with reworked anchor tags they
are not far off!

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/dtrace_builtin_variable_reference.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
index 1132a041a..1a0572c64 100644
--- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
+++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
@@ -31,7 +31,7 @@ Macro arguments
 
 </td><td>
 
-See [Macro Arguments](dtrace_builtin_variable_reference.md#macro_arguments)
+See [Macro Arguments](dtrace_builtin_variable_reference.md#macro-arguments)
 
 </td></tr><tr><td>
 
@@ -127,7 +127,7 @@ Target process ID
 
 </td><td>
 
-See [Target Process ID](dtrace_builtin_variable_reference.md#target_process)
+See [Target Process ID](dtrace_builtin_variable_reference.md#target-process-id)
 </td></tr><tr><td>
 
 `$uid`
-- 
2.47.3

