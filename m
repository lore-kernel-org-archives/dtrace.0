Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD98184
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761259867; cv=fail; b=Q5OHYHo167TPkp20S4h/XGPLD3fLwGUe6IXTyYqxv8NB0kN9lmmGkae3TLJru0ME2H2fB9k0en9m6f9QyZHgSDZMInxm2wkvgSC6uFo5PC8C4spcRgND22reS0fetyFJW9JrU5wmmSaNY/1S8bgaZFVHQMZDXISiL1kr5fi53wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761259867; c=relaxed/simple;
	bh=IG789BgNXszWeBuc36naYUoHxNcbdoZy9i0acLllijc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aZqcs4VunXSckQF61eDszMIPwtnRHaumrnKbQK+XCdvZ0/DCiyW7JbjppEcftl1Wq3IrjfzCSRNaMJfx+wKOyrkN8deumh+jvF4fH+plLh99GrtvWz+ntETtyKqc6zdzzxg7Di9yBHh/NlK9seRml1GBwKRTDy1NRUZ8l6XlP4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WV59/y7H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wvJTkiYi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WV59/y7H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wvJTkiYi"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NLO039001598
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=VwEyQ5imQQE3xCkLQq
	4vBapLT5wPcTKgR5yCeAdw6BM=; b=WV59/y7HqM7tc/0h3Aia82W5zafC4F6aaC
	psiRf/DQsC10YKQc6xzm0Eljq3gQUt3LrZ1k3RqCtXCPJwVclScNi9HTuYn3rrRO
	NzqvvHrsLkr3WArJqPVq8Ou8OB4ln9gF8+P3w3MRY9izx9g7B/QvtPUHeOVzdk3+
	fEOQoYgsT1Vq/p4Zcet1RnA8jj+rAs/BUZ91wKlAkoR5O6OW7huqAVvjMYu/mKSo
	EuO28wfg9rpCiKcMAhGEk2IjLPWfupdnHEqEkNgHmdL06in/bEyMhxpUFZt8PHy5
	JEo+ASots3bEkTptOXle7JtMgnQfx7e+DuUth2WX9kDAq86ruvqA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xv3kum0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:51:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NKXpxT012444
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:50:59 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010065.outbound.protection.outlook.com [40.93.198.65])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bf6bue-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:50:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXPyl7NLMjyf9uNyJblKT0M2Cwg44s3JLtkiBfhwMduomORTA3wx7UlFmJ8YQFC1fI8bMkLW2sXHdKtOal+V/JM7Kso5wZbde5wH9S8pzP0iTeF1o6ap4K6e8vS603DmG1GRpoUzeKeSGqfy0pkvvsaZrTrV5TKT2uEQAPYYmlV1KNZpSEt5glaHEirhAY+8CQ5BCwtDj769lZRyBP1ygkDfl3NqsLBiABub0oNmETb6z6J00CJ+fqGc3e4qvt7uin1DjPFGBU7hilYHf0mWRy1IPVzZGmrcweWykrfEkdg5r+DMfhAl4ormiQib6SpJ6fmfTmIGgdGdPPdYfgZlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwEyQ5imQQE3xCkLQq4vBapLT5wPcTKgR5yCeAdw6BM=;
 b=dmp2lNRp2CujhrfPkZikXNd9OdM+33l4R4AiG0fvQXT4xCe259TcSzBXfrIqW0A1pSUYdRyI9iazaGqdOEte7IjxNXFlj4wEZ198as4cNDioCqoKuAD/Tq3oQZzItJhyUO9Xsv+t7kOfp6GCi3A4nzAFRHmVSAqIHCXDPeLh0YuXyMkpTCrRzyLScQda0vLKFWD+VZigbhw5ifLO9Mq+2RToWwnWqPo6tiMZyC7wC2xX0zF2n62cX1XEIaP9WcwojEXNN+in4YUOPYLA9HeYd0vEcvJg2cL09l9pYksUt+sHjFTkKZ6DRDGgSzLn0YM/RCkU0rbhju60uNIr4j8Rag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwEyQ5imQQE3xCkLQq4vBapLT5wPcTKgR5yCeAdw6BM=;
 b=wvJTkiYi7SocLXb9TTnHt5q70r2leM6Os0+jHI11YS0KMurwoHALNY20d7WpWjUc3bEQu2VbGLFwOLj8+PppZqmvvZW3VIs2aXP+qYFTVAGr4PwOQxsatMsIU30UfAaO6E6Zz7hkjN2OcOxWmAfQULunqMRpe6MN9C2InNguaRs=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by DS0PR10MB6846.namprd10.prod.outlook.com (2603:10b6:8:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 22:50:55 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 22:50:55 +0000
Date: Thu, 23 Oct 2025 18:50:51 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] doc: Add rudimentary documentation for using [u]stack
 as a value
Message-ID: <aPqxS0Rxu3T7fqug@oracle.com>
References: <20251022042451.2987-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022042451.2987-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|DS0PR10MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: d36237ad-d751-4ef1-5c57-08de12869fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b05ustdtA8++OV+kANHzKNw/QFJBGyDM47kMxMuMT1RlLDojFHAEfM3tHEUc?=
 =?us-ascii?Q?0Oiue6Jrae88dTxrlndPnL7W5YATFHDmOZojMUL1XKp22lMnE2/Jjo4rAZQU?=
 =?us-ascii?Q?nFgBYqjkyXBkeuou+GYcoTab+7sle/bX7FJMii/iinVKnt9Xqa9ZPNwjUEOg?=
 =?us-ascii?Q?hJivl8bjEe1y9Tye1+m5J8k8mmTFZjmmf2Vmlm+Fw0iRhv0r24HROZszp6wu?=
 =?us-ascii?Q?nwDwmWzORYZ38ichKhMQ8aV+I4A6SV5rVbw6OBpcLO4vW7yLwohjp3cnTYYu?=
 =?us-ascii?Q?71TL0Dcp9dRgiYEVsZFO/HXzRnE3Pze0qKflqzYa0aVjY6mvvTZKqPMy3qQs?=
 =?us-ascii?Q?4klV7CzinaY0/LKFr3KAJ7StE1bGbLBhS1FVQ6jzUnE2CJMUrIZHAx6wVPM6?=
 =?us-ascii?Q?WCeAVX8pnOUNnvgNCGMDSHXBTPL1kl+mFUvOiIV1BwmubfyHDQeiRlYL3vDx?=
 =?us-ascii?Q?8MoQMgX9HLae3kPfnL210+ORVnmxdnjSgK3MzQ6u6ziFnKLXwFsCfXgZhN3i?=
 =?us-ascii?Q?ZiQKy39d12UuFXZhftUKF4IxRwzYr8K0PpQtYoYbFsN/9NjA8U/cnYLAboOp?=
 =?us-ascii?Q?QA4kC4cqxf0EQOGYo5cQNjpxv3pUOyFPw0T2D6OyU8OiZZDPgs1WAdrjHJPY?=
 =?us-ascii?Q?yQdAcjfyCCy66Y+TU5WZY3hI/slLpARdSqiro2kmLL9j4jKwYe0drnGlzK78?=
 =?us-ascii?Q?2tdye9Rr3pi+5sHs4cgvNt5ixKYqYAqIckHQwsws/1cWWR7jeM7GQ0U4Bvkh?=
 =?us-ascii?Q?YCcglHzLxDllqS+p89mIRWoADEDsmhSUvtqj4wThvS1GL+ShOte7uWU8GEE6?=
 =?us-ascii?Q?GLBs3cJmVGmsa53vnYJwOsgQonqo0gGf9TTKCk9hRYiRk6oCDi71kDbIeZnC?=
 =?us-ascii?Q?2FX/whvqKcIYEwjPFnC2X8gdRP2rURVj385ScFgDnL3BSX7TNsjPNmIKDL4r?=
 =?us-ascii?Q?f2pvdYZmlucIlS7SVSYSHiWK8r03+4fAOcBS7dB8CZJvSoLnvlTdmDtP658J?=
 =?us-ascii?Q?J0KFvrUaHI+4na5RSLosqkTDDSg4ecLJjngyivrQLIULP/lSvtw8u8ZsXwGY?=
 =?us-ascii?Q?4MfqX+62NIGZ5InpUeW+v13VHYxkht45o30X3FcSEG64kabFnwIdQ3maaonc?=
 =?us-ascii?Q?Y510SB0N4rM3+5lw/OSREUNcqJyBYoYnmGUIZ8497hT1bI0J8E+viAp8bSbq?=
 =?us-ascii?Q?TDKsDMGW2jADKZ7wantXnw0SBSyOOfCBJvtfCJ68xSHACgRMLKUAaCBIACfg?=
 =?us-ascii?Q?KHRH/holjrkikHZZH6NnDW4NVRiBl1uuM1XwDpmfkxRs+sDE6QiPLPw81WBz?=
 =?us-ascii?Q?KQa3EJKBBHY8wFNdLCb+/h22As+KNz84FqogO5X4amGdLch9O796GSn5gh8G?=
 =?us-ascii?Q?dKKTrbFjopY07s25tunimAvvXhFceR8FescSoAWhFZNZRvkVQg8k2SkNs/6k?=
 =?us-ascii?Q?o9E/IYFcU6DEIusUQedpMmEBSVU2/kBZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RuN854EH8tJHYkkGpwgq1Qf0MQo73Q9bfqUD1CfuKrrnQpyxrlUXJH8+JmSq?=
 =?us-ascii?Q?K/HAUJBpy83oVMnPphBJZyl+9DsN/zwjJ4k2TY2gcT9Cc28WiC37nNS1r83N?=
 =?us-ascii?Q?cuVbuQjeGvt/qTWDFSeOqVP5ETbJklD2AJm3ZJQaarP+LMqo21bKoTvLOn2A?=
 =?us-ascii?Q?orETZ6BEklF8QrLCdoxJttePXgrRI46CBZBK/+BoL/+acVn5+RUAtPgb2xNw?=
 =?us-ascii?Q?X2ga7CocYizi6+w7LIbm9ae19LOGd/+nW/+GkCzImdnmpyOcGlxczSHFYO9S?=
 =?us-ascii?Q?A2D6f1ULmh9wyOd9xfpZMDTFnjCL8oZC20X7sdRAj03M0VJSN/FCWIBI4MWY?=
 =?us-ascii?Q?E/0HoYJAgZBNKEXKhgyL8vBQlrhUoY83KTuk0D2qReQJec0ank9mLw9f6/LP?=
 =?us-ascii?Q?lLMIW30OxlEuAGJbef9O4ftWmptOCAHCc2dxg3JmNI1vRdG6gDDMrrUeDY+5?=
 =?us-ascii?Q?wwD3HcJzfKGF+439AwCVmcwakNDj8/PCNHpLG94iZAm+euGhL3jed2SDdFo6?=
 =?us-ascii?Q?P/skK8GcEivJ8yQHfCin4BzBxkiDgkubR+gSZ8IfeYE2pe0z7O6fxYzXt0or?=
 =?us-ascii?Q?0pupmTQ6XkvJ7Qs3mrKK8+T1oi7VbRb+e7zTLhUYP3OU9QvefRTKGDEg7WSz?=
 =?us-ascii?Q?l4DYbGdxATlgO9SbjR7VV2jTJMSgJ8zv82P5rCxH8D1ORHywqAJ6F/jbVOIq?=
 =?us-ascii?Q?YL4rO93kzupc7WLycZkodcOB4qT0HZvMugoNpVSWsk4KsDqYlBpU+0oCFLGB?=
 =?us-ascii?Q?Thr87g0bhEnBt2wZnQ2+MDGcstglJnDq2XyqK8mnFa2hEZNRkk3vV8qHsRoF?=
 =?us-ascii?Q?73fulpYdRap2vumj2823PVcFAfYZOeE/LZdtfgXRyJa6xwBg1lhTtNdrgGC4?=
 =?us-ascii?Q?o6HT4g8eOCyjKaDGCCwsKJN88ssbX3yloCL71Y+rWIjgUMlVIwKvh5vDzaWa?=
 =?us-ascii?Q?ybzwTaUvFEKc9PcrtsLdhCldWWALICWxOstcJA67V7PNlANzphuwkPGm1E8k?=
 =?us-ascii?Q?7efPhseFYTQMXzgdDOtx9+fIzwSL1WGQrauuI2uLkb7wTs7wnXf1IRv02nGy?=
 =?us-ascii?Q?/PBeLbZ0B8OEOgo+pDN47A31DIkahz0TUki3Xyh6HGxMiYJdxBhBMWPiXZ/W?=
 =?us-ascii?Q?pXiMqBoEWxF7ozb+4Vqebrr8CLhy5Id6KQ0e67qBBmh+JHOdg4FgWmzdK5aT?=
 =?us-ascii?Q?py1wucBxsHv2FkwbQ4L9YCul1efRAecE0J+yytZpj1pomaWon7bhDzUh4Jue?=
 =?us-ascii?Q?XDSVTOhUVKNuHeC85ZbVTxwKvZ9uKzG2omE6kf9FlOSrQvMOBJ2ZKOJVpSRv?=
 =?us-ascii?Q?xxJcQ1JPNnUrfLm/ZaruAgnkY4c9Krpc/NnNv94reAxzE3WeiEyCwVnse9tt?=
 =?us-ascii?Q?Esn4Ux3HS46cYZM0akEVLuco/5hMn0GknipfLn17Eoyufu8riOUEd3FIbV8v?=
 =?us-ascii?Q?hKstQkp99ZFH/BWOOGQjWJuFFMxLglcgGbyhe0SAt9CuET81Q4NKQ9J2VGVP?=
 =?us-ascii?Q?o9/aR2gKVNHxu6wshkzhfPV9BSOR9gJhDQJSwU5C2dX2545hsASrUhupHlsp?=
 =?us-ascii?Q?qZnJwXkMST6i4D8nIum/b9MFcjcYjWp+1ybYBPJjCiDAjNzekvaP9jtqq8Je?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T1IgCi+o70FeY0akFqkr5GjBa1B84wmp9Rri939HPZ3pFC4Zr7Vx71lxd1QhcDxDIkO9DeyWilGQdBb9TSsLcHCAy/q6MzJ3KZxrphzGUt+ofnnYdatmfDIq0b1xnFy/M7FL8Y6j+LV8fS/167NEj4/9BiwGfSL4NL6Juyy8dzmJjH400V7Wf+QjYauX/C8h0civSDdNvoqth23FcjdXI8c3WOpdMHBav2sTeefd+iS2dbWayIrfSiXX/+yZeHAsILTPnxL+g5lhNqX98znySOc5KdfFIt1//s2PYRrNPtIuvHeYfNg+mIC2JAqrTdXcPcfYJHaWvujFZcSu5Y8+CfSfNlL/8LWQ6DXRpXJhr/HY17SOhlfCIJa2pZetvbthjGi+QZPib0K2hgdfhVFyJmL9dKNWaQGC++wKs9G7QobwJB6RPUr81e2B1HwM6iY+QDe0MJQSAsywTCEsqpgmYRnIU+8VcFrWfc+5MTg1COYzavjWQ2GAz6xooJWlWdkSLPDlhN/COA3YfjNDI4UNW5MQw6DaUVk6O843+DF1Sb12ePxTnX6DdTfC4AvsCSNId4Uf0amTI5rCWMS+0GfMlRFHu3lgVqqrFplrhWAgRqw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d36237ad-d751-4ef1-5c57-08de12869fc5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 22:50:55.0493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fi7K5p9A56Be+KYXBkRwFt4ZRULoCI7j1P74gpZM6xs3bjbvp3vS9me+IgpcHzr2qNTzqnrgjtvhKUbvr/+aJhPWQrK8D0xXR9AftbAhujU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6846
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510230209
X-Authority-Analysis: v=2.4 cv=acVsXBot c=1 sm=1 tr=0 ts=68fab154 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=KgI3hAkTGFsENHZ-rOMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: iU7p6FpzKnnGddM2V4p_8MlR3YRzTUKw
X-Proofpoint-GUID: iU7p6FpzKnnGddM2V4p_8MlR3YRzTUKw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MSBTYWx0ZWRfX5BJwFjoiuFJj
 iVZhMGZgOI9IlAxW2k26dvvFO4bKjc2KwsHo9/RcdaUnnHX1waidJ3ADcONHJy83ZvRYSEWqiiB
 bTbbIVcWz6ilpLsVYQQx2v4Uk40Pwlc5dOxiDvOqo9OdWJ21c6RbRn+vaJi8uSu1QG1iS//Zcm1
 910h36+Cz323gBQ5hXx2oXRqTc3OtARJGAHD16cL34SlnOA8yfhey6DqHeVH2V2PkLNnte9RnIa
 UTlYz3boPDH8D+P735vPjFAYTEHUXV47aT7ARk1cei8A5xdW4IILgQ2JNPvnNhaydCZ/PWtNe2m
 5D6rVdBORTFvPdqLck4Q4UW0IjXOFWyks4Q9WSzVfE6IYb+pPx9dER4izol2ILWFwl24CsPZx9L
 Ko2nj07qJeEgs4WbBZYrAtY4Sl5rLA==

On Wed, Oct 22, 2025 at 12:24:51AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> While we are at it, break up some of the super long source lines for
> future maintainability of these files.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  doc/userguide/reference/function_stack.md  | 26 ++++++++++++---
>  doc/userguide/reference/function_ustack.md | 39 +++++++++++++++++-----
>  2 files changed, 52 insertions(+), 13 deletions(-)
> 
> diff --git a/doc/userguide/reference/function_stack.md b/doc/userguide/reference/function_stack.md
> index a92c61a0f..903d3f090 100644
> --- a/doc/userguide/reference/function_stack.md
> +++ b/doc/userguide/reference/function_stack.md
> @@ -1,17 +1,33 @@
>  
>  # stack
>  
> -Records a stack trace to the buffer.
> +Retrieves the kernel call stack.
>  
>  ```
> -stack stack([uint32_t *frames*])
> +dt_stack_t stack([uint32_t *frames*])
>  ```
>  
> -The `stack` function records a kernel stack trace to the directed buffer. The function includes an option to specify the number of frames deep to record from the kernel stack. If no value is specified, the number of stack frames recorded is the number that's specified by the `stackframes` runtime option. The `dtrace` command reports frames, either up to the root frame or until the specified limit has been reached, whichever comes first.
> +Returns a `dt_stack_t` value that can be stored in a variable,
> +including an associative array element,
> +or used as a key to an aggregation or associative array.  
>  
> -The `stack` function, having a non-`void` return value, can also be used as the key to an aggregation.
> +When `stack();` appears alone, as a singular action,
> +it records a stack trace to the output buffer.
>  
> -## How to use stack to obtain a kernel stack trace for a particular probe
> +One can optionally specify a number of frames.
> +If no value is specified, the number specified by the `stackframes` runtime option is used.
> +Frames are included either up to the root frame or until the specified limit has been reached, whichever comes first.
> +
> +## How to use stack
> +
> +Here `stack()` is used to assign to a variable and print later using `%k` conversion.
> +
> +```
> +        v = stack(3);
> +        printf("%k", v);
> +```
> +
> +In this example, `stack()` is an action that prints the kernel stack.
>  
>  ```
>  fbt::ksys_write:entry
> diff --git a/doc/userguide/reference/function_ustack.md b/doc/userguide/reference/function_ustack.md
> index be9436f82..a70cba54a 100644
> --- a/doc/userguide/reference/function_ustack.md
> +++ b/doc/userguide/reference/function_ustack.md
> @@ -1,17 +1,42 @@
>  
>  # ustack
>  
> -Records a user stack trace to the directed buffer.
> +Retrieves the call stack in user space.
>  
>  ```
> -stack ustack([uint32_t *nframes*, uint32_t *strsize*])
> +dt_stack_t ustack([uint32_t *nframes*, uint32_t *strsize*])
>  ```
>  
> -The `ustack` function records a user stack trace to the directed buffer. The user stack is, at most, *nframes* in depth. If *nframes* isn't specified, the number of stack frames recorded is the number specified by the `ustackframes` option. While `ustack` can determine the address of the calling frames when the probe fires, the stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility. If *strsize* is specified and is non zero, `ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel. Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace. If such frames can't be translated, the frames appear only as hexadecimal addresses.
> +Returns a `dt_stack_t` value that can be stored in a variable,
> +including an associative array element, 
> +or used as a key to an aggregation or associative array.
>  
> -The `ustack` symbol translation occurs after the stack data is recorded. Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible. If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
> +When `ustack();` appears alone, as a singular action,
> +it records a user stack trace to the output buffer.
>  
> -## How to use ustack to trace a stack with no address-to-symbol translation
> +One can optionally specify a number of frames.
> +If no value is specified, the number specified by the `ustackframes` runtime option is used.
> +Frames are included either up to the root frame or until the specified limit has been reached, whichever comes first.
> +
> +Stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility.
> +If *strsize* is specified and is non zero,
> +`ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel.
> +Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace.
> +If such frames can't be translated, the frames appear only as hexadecimal addresses.

The 'strsize' argument is recognized (accepted) but we do not actually use it
right now.  It requires ustack() helper support to be implemented and it also
will require additional work on the [u]stack() subroutine support to allocate
the necessary memory.  That is more complex and may require some additional
design before we can provide full support for ustack() helpers.

I would suggest either removing this, or adding a note that support for
'strsize' and ustack() helpers is not implemented yet, and that the "strsize"
argument is ignored.

> +
> +The `ustack` symbol translation occurs after the stack data is recorded.
> +Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible.
> +If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
> +
> +## How to use ustack
> +
> +This example shows a D clause that stores the user stack to a global variable,
> +then later print it with a `%k` conversion:
> +
> +```
> +        v = ustack(3);
> +        printf("%k", v);
> +```
>  
>  The example shows how to use `ustack` to trace the stack for an `openat` system call by the `date` command.
>  
> @@ -19,7 +44,7 @@ The example shows how to use `ustack` to trace the stack for an `openat` system
>  sudo dtrace -qn syscall::openat:entry'/pid == $target/{ustack();}' -c 'date'
>  ```
>  
> -Generates output similar to the following:
> +This generates output similar to the following:
>  
>  ```
>  CPU     ID                    FUNCTION:NAME
> @@ -35,7 +60,5 @@ Mon 20 Feb 17:38:15 GMT 2023
>                0x7f6d63fc2e65
>  ```
>  
> -
> -
>  **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
>  
> -- 
> 2.47.3
> 
