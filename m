Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D993320A0B
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 16:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770742139; cv=fail; b=m97sp+2j26aY+8/vuhqJPXozBtWaArevq7T/0nPbPiBSuIQTkplsUerQrRaGxcic8E4prjoKuxn9IE6juGd/bzlFNHjILROO0WvToBdIm+FPNuTJSo8sxrwkDAj4saOrLgUGPoiwd5phZqkdBPSWBma7DwVNXd6bV1mThXlBLlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770742139; c=relaxed/simple;
	bh=VPVLUq6suQ2epXYtXama90RLZULBVH9WJk11DZsC+us=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=VC+jV0NH0LvluxSGUdikZUpuStmkIC8fLpA0Ljkv1YgJo8GDHnQVidTfWQk1iDcR0a0q4i0zB8FtA6VxCfgc6Qon9AGmxrhzBCG5DpfguUulL63zi2/ysoLvIZxNNLVVxzgMOL3d3YksH1EYbpwyZ5zJeMS6HQu+tBHXJye5IPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AiqFTOzU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PP+6LwP1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AiqFTOzU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PP+6LwP1"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A9vKv03608192
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 16:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=NK4wFmemmT1MVr55j9QJaMs21XdPeEuLhVouvGkNC4U=; b=
	AiqFTOzU9DvhiIiq/UQttUO3wKm8oEMK217rsh5zlcuc6Kb52m+rMUUub7TpUc7U
	Qw/l0veqehdrA+3Jcz/42DCUfS9Hd0ysbG/t0GShO8dztAk3r4ZA/NqfjGMQdisL
	/SbIrV66apd0Xn+XRcmcEbbsCKUq1JsLcoQoVC8nhtkMQs0KXTVqeP7tVfqFpvGH
	PiDI/1bc/DP0l7gf+ii9CPS+J/3vUgUPb4FGa1MKcYn6L4dflviehZkKMP4WtgMS
	SGE1xQfPxN2d6jL5AUbPo/xNPjS+bVN1l44YOYK1EKA2oEBuii6GV5HNNCcV1nQv
	NAHpnuNrCjR9B5RufYKpsA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xh8vcb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 16:48:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AGIlIM008003
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 16:48:55 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011002.outbound.protection.outlook.com [40.93.194.2])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8234h02g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 16:48:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvkIk8IVF2LNe5NPmUx566ZEYfEWnXQtoiNMnuCPc+V2r4dcbkJc5CdKo/eKKKyOv6PRIQR2tbSRplfMKJ+bwT0COanBTtBD7a/AJa1aTQerX5xjcmHxum/wwhvzihVU0+Zxn91raFQvaAApXukzBuue7jrZrlEUzeahFRVRVIdG1Z3Wiige6CHXCjEbfzJ9N0P62A+SVUWQhbuKUWSQdGF1cs+UB/5cpxb8mbpbbF/mlaZCxwg3z75zYXzvecBCayS/SnBxHaHh3RVkiOhZFZB6nGbdmgJYrwXLgzASfe4YWDWVm7Ff/KRt3puI+DsQBzuUMpR75dg/MKJhGs4orQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NK4wFmemmT1MVr55j9QJaMs21XdPeEuLhVouvGkNC4U=;
 b=pGXX6P8EMjNeldYH3700c6IlEznsVI7WE0NK8QEF9tK1rZgt4xmX5FI+SHtCfoZMS4x7+CtzEMYa1xc5wjm2hS7Y19SojFM5udi2cfBfebCmy4wt7TtPwlLuRR2qgluErsocKcxNSUod5aIF8O/DFgIpabNN+8N9ty78yXU5vIUtP27qrUThd1NIHasNHZs4M4IY0AdSbTFQL/oaCy3mKBTubuv7wQC/Yz5M40/pxCqRXtDNOPIakXIOVMceYOUOlFCnN0WvunPMOOFT4k+w/Vt01JmNeCUkn+qot7Y5m6ls7y9EgKdQL2Ws5zr1U0BBAdxk1Dil4u6HkdtX21oSsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NK4wFmemmT1MVr55j9QJaMs21XdPeEuLhVouvGkNC4U=;
 b=PP+6LwP1JL1IB9z8EiA6kVd7MF3Mo9qUC2t7Z2zMdrM3nxmYIaNiBMEDF56zYjYZxpZikt4x1g9kg3saSzZP2O0UoyJtrkDShfBw+DCr6V4N/2ld/r/5U8zjyQKk7fLN9gWpOZ7xEYEhHl5Z0EKZoBtW3ZIFys6CN1+E/DUG1qg=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CY5PR10MB6264.namprd10.prod.outlook.com (2603:10b6:930:40::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Tue, 10 Feb
 2026 16:48:52 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:48:52 +0000
Date: Tue, 10 Feb 2026 11:48:51 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] test: account for member name change in mm_struct
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752267259322167083A85C80C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CY5PR10MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e9ea90-6445-40c4-ede7-08de68c445af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xogNNzEpaoFNaogmR5EAvpQCCMzj5tevKV2DG2puUm04njTXnGY420ClUQnO?=
 =?us-ascii?Q?cxPeefIINLdX9BgfWet8QTjEKVlWK5jj7AUlrbWI8DO40AHLAkUinuv7B0ly?=
 =?us-ascii?Q?tWhurLd+X+USl+zrgmNVyREPM+BFELI+mcOolWuyeTZogh0kxRjmQ91Y7AFF?=
 =?us-ascii?Q?cLTvZ9e6vWcO84aLZ4K2xNjpOdM7ESEjCgzZfr7Rxe2Vdah1mqVjA2G/7zd2?=
 =?us-ascii?Q?3yXePT63mx7NM2FHY29aA1ldiJRwfcdaxzXt8XaTgJ/YIv+IIgPmWOIXRU8T?=
 =?us-ascii?Q?00mvTyxwQXDiqkU8h//HKAuIVNNKwKfoh9AQ1fsrLAXYoOeSgEDc8vmE6ezf?=
 =?us-ascii?Q?fRnuL2jWdI0jfuMqRiZDJ3GD4hLMXCKgn3OC8zVZRAhh14hyCh0BAd5rux57?=
 =?us-ascii?Q?u8DfNn/RYJyrXnE40U7ca2gunFNRa9FbVL27tItjZcVdtyu8tPMbCdbvaoLo?=
 =?us-ascii?Q?vVRBNbHU85ADyXuxbjZpvr+t627+gG+st1yDgzWEyAgDswe+aK3WQiaLboPt?=
 =?us-ascii?Q?9PD7qBTxx68JKmzwQu6WSjh249Bb8wS7B8dK3b5Q+mf/nILtbO2j42Gl10p8?=
 =?us-ascii?Q?QgmiNBSdCSnWOr32sMI3TB1Ovm0tlHD+WGvXvqQ9OBVV7OltUMMXe1Q8ONN1?=
 =?us-ascii?Q?XrAGaUCBTBWYeyWv34Nf4VK10Op6RpLAP7HyvLQ9Rq3Pkgd8L3ddkQU4jH5e?=
 =?us-ascii?Q?RtLNnZ+w8YadvNl+b38K6ITjf/fGmNvMDk15LKWWb7Ln1HCu20qljDXlbKcr?=
 =?us-ascii?Q?+BzSbvPmQeqTKfLSQkJjxNYcc7KIK8ddF6fdQZAZRbyv+y2YfCyku3iKrHh1?=
 =?us-ascii?Q?RpiTUQI2aLzV6d62XoafXVEoW8z1yB3pZqjN3cZLpKpvzMjWXKFDXlW+g7rD?=
 =?us-ascii?Q?amN/8vCga6YpxiyI76fSyaKg90BN6A9QBjnpxjCA6I81i8PhHtd/F+7dcjol?=
 =?us-ascii?Q?Oe/dvadxUU33oIpr5yOkLWZSL7SwWiaQ29CsFCHYVQ6oc5p8FvmRE47EWvn3?=
 =?us-ascii?Q?AK/jMGNsZNwsXzRnRIDmL5YQQNQcdSUq18ZrTNJ05jEsFzQVhVaCuIXbjSuC?=
 =?us-ascii?Q?VIzp2zH5s7msaK0+nsoD1V4DeNBC3sTh9RlPEQebf4Z36acqXrYBlhRDfK0i?=
 =?us-ascii?Q?GLI7CBkYLvnUQ08IVcww+5ZGGkeQRbr14yWRwiuy9Pq0ZCfqBpAFq0HGyY42?=
 =?us-ascii?Q?CB/HT6hMuyFYzSTC3NoZc1iRDekHcbeCeSNujljDVghiz29HNUCLzFl8iNQa?=
 =?us-ascii?Q?ZR7xsk9girbJE8wfc2Y4xE864d7pB6PWh/yO3mXEgS2YGs1F4WB1jkmkym45?=
 =?us-ascii?Q?yipdUTiKItPLA1uMEMQe31wRhbBYGQKWITjA6NUz2hwq2P0s8woY8wIemexu?=
 =?us-ascii?Q?WnNdDoDlPlbq6o45U3UIDWEhI3PbQe0e0k1mpUwtUmD8cc/jM3Gxk5qDcfVc?=
 =?us-ascii?Q?xiJJvs+jd7QEa9K5g6WtvD8C1VAW2qpQpNLaPhmFnHrjCQdxJKIPC49hyjg9?=
 =?us-ascii?Q?AEUs8hpwWALb3wECm65h4F3+rV7k7RIsJQ1QyxgKF0Pi3ahijSy27p81tIRH?=
 =?us-ascii?Q?JK6H9ZBOso7oMrwhDIs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K2a3B5zK757n+0nvVR6CTJGgG7bHJxTz2AJrK6ywkQ7LrCvr1qFs0Kox/ymZ?=
 =?us-ascii?Q?6+ywMzc7dScFZVXu1F7sBPfLrWtig1vBBSumyCn1vTXS4nXVWv0iqf/ZTLrR?=
 =?us-ascii?Q?HXwT3difwLuJ2Ffu7w5LukvzG21LDB4eSImLgflF3uKvbkckgUHqXfNHznJq?=
 =?us-ascii?Q?Ko++Wt/KtWTYO5rGHWZYmhZVHZFJ6sO4TzoAlyiiyLRkqz82Fiq5DE4t9g56?=
 =?us-ascii?Q?04bzO3QD+SNv4SVDrX00FOfPVxRfOTu7erLhp76GjlEp6qRKMk+YM8iIsF3j?=
 =?us-ascii?Q?ZCR2x22GeTTjZHRA+iEb+YdFHpXBePvyv6X40tALSLcp5v55cBZ6bqmvpoyK?=
 =?us-ascii?Q?UuaY1ZZOirm1DgsxBH9K2SLu1qoH7JBM4wSQkIPVVFt0xOAyJsQ4ZX09xWIt?=
 =?us-ascii?Q?M104FL8UnA17G03x1SDCHjkkNHqeXSiOIPKRkmRGtkZkuZe2uUTfUPPYB0zo?=
 =?us-ascii?Q?oYGJSxzirBO55M7f8yM1pwiQt9x6pWkEfEVbTniwdrKK7CADsPUAYBKMYAEA?=
 =?us-ascii?Q?QSD+feZ/77C2l36wHS8VEU/JfBICxniqOg5RhWbR3jJyqglCrkC+Ku5Zsr/n?=
 =?us-ascii?Q?pk/0C14Zn9e1MZld98TRx6cm5IQBY8CTFMuwfmb2qnVGozdvbmsctvOoMKPB?=
 =?us-ascii?Q?2QrW1xhPy9aMPtFAO/pO8EfmCr3M2VfLQgJc307Z+pjIcrI7r3uQZclGEXNv?=
 =?us-ascii?Q?TrUuguHFndA7eDL9pU7PJXYMPLL5td1ajztyzdwMyQ4mvotjxsnNLsNFhEre?=
 =?us-ascii?Q?2sYhNhGWYBZ5EVMuZOaD9x6m2LWYTbsrGHzM9VnsNK6AAQ1Rle2SpFLW9HrV?=
 =?us-ascii?Q?vfugjdcDpXqtHADARuy9ZLAa80B6qJup6LQ12CBNtggi7i9Pd7Dy+HEvBx/r?=
 =?us-ascii?Q?LjQChMTUr0sw0Dquqrrw0AnZiz0NPlSyARkQoqzMJCtp5s191hz7NE/IDD63?=
 =?us-ascii?Q?jes3bBX0c/hl9Z1+4eD+S1tboYZav/kMovMgt67d5XzdXM+r7gOKbjnFvh1r?=
 =?us-ascii?Q?IlkpAgGNudS6muU39G1DJTyH32LQL+obaII/1v6pZn/xC3fTc3wQdfTsYm3p?=
 =?us-ascii?Q?09Q9oDzEYaLZFTvE95egF+C3Pws3mifBkajsrRGI2gcpcWXHlu0m7errvdTu?=
 =?us-ascii?Q?jcI8epDudovooTDm2oj+vUC+I2CPrRH0qc9Uayj9SrtTILyZWmh7/sC4i1Xv?=
 =?us-ascii?Q?rZ7f7dlyi1RwZ1J9VPn9yl7gOVDb51facw1qeWx9/GxfcidUy2VySO234dyy?=
 =?us-ascii?Q?HRHUYYN5WUiDFQJRntXsqYQPDUw9Llec7t5NZ3TZe267LhwP70uewx/ZA9TV?=
 =?us-ascii?Q?IhqKmN9KZc2npjGg2jJLYCpvFQjbrEPEr/CnvfgXcTAjeUPxVOI/NbujlTmn?=
 =?us-ascii?Q?w3N7+o2vkx18WyvHTY+2kTN255cv+tEuVBh/p10hotVfUNc9aVAMSOj4Kx9g?=
 =?us-ascii?Q?oFjqD7BGNze6tuQ903DODCKAbzI8c64upp/GbXTiPl2LkskvepUTZsHsMsNR?=
 =?us-ascii?Q?HWJgGopsLMaK54/GLF3aq8W1g5BSgJVzOx6oovYX3mN4/Qcj0+X2qWIfCvX9?=
 =?us-ascii?Q?gAloSn3huAxQ1gZQXelVNYm/kli+MFbi521d5ktTVHTGAAZGh+XJbbJ26UGe?=
 =?us-ascii?Q?gZjuTo19oWnUsiombU1+pBJjRLsmjYSwZozFFlatdzbJ7pLpbG93cClrcOGK?=
 =?us-ascii?Q?9qE5p5XEphwbLV7raquC2r4k5IrKl6XCkX708ruIy+1uiyjDFhN6ZRx31TBj?=
 =?us-ascii?Q?U3jzM1J+rhTmuUWyFsIbOnm153atByk=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r+1m4SChdkA+W0DJKD7DXqQs51uLa3eErtaOvXVJVwVlrzMQkmSaS3pUazyXwBJikXcOxoz8+BH1O0L0LkNDMixPSUXJ5h4hlzrGpklB5n0bY+4qKaZzM/1Ow90GggnoXFsNFh37eWgPup+yLrg4MIp4jvpo6dYV2ab64WxKUwk52dO2MFjpM2+40OaMAMnXahKreAfY9ghSK2iKCvCX8a0TeQToBtwovM0N1nPxYukZk8zU4R2Tub92nqtVl6Hqdi2e+s9p2o6ZLueEEShqwK370GcoRWBLIDn8IhuttTRloKPUHqNBltHejCSYthPdAOnLkBdqbx5Tc0CIBx7mBQr8BTWrdAQniDEDNSkwbbtmgxh1MlGXSgv4SuRdt7l2Ean3RAt7sgTKb2XzSbUo7/jN/5oBIA3kRIw9fPeiq19ypzlrcAhizMPujxRmKNcEnAjlIFGBW14QhpZR+r2mrYbZrhRXh1aBz9HjcoSUFHU8Q0MPdwr7FdCDtszI8nEtvaKInQdhLiKQYwmBfmWwo9+OjUSaZZ5tMIRqmBuzgil7vX+jkTB3ejApqgcDjsGymoHZaqWBggv69s4T4fS4oQuyNCA/rZ+lgzWtxcYAneo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e9ea90-6445-40c4-ede7-08de68c445af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:48:52.6790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrnSD9QWd9Jt8x/8T+BuOszu+foOUKkWXdhE77/Qbc3OTGIoegf/3AVjkDOBI0/U2Xtz5lcJEjTdpTRPOp1QBka+KJc2IJJeW5YQR5d7Ivc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6264
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602100140
X-Authority-Analysis: v=2.4 cv=YbOwJgRf c=1 sm=1 tr=0 ts=698b6178 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=UuTJR58Xwip1wQKR3-4A:9
X-Proofpoint-ORIG-GUID: dYRP76weWJkz6ttUUy_qjiFV6dJM_8pG
X-Proofpoint-GUID: dYRP76weWJkz6ttUUy_qjiFV6dJM_8pG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE0MCBTYWx0ZWRfX2Cr0bqaDA7C1
 jMA9XD6NtO/72n/8CTVXrvIXNoY61j27Er5CKnjQkwAd9FH5VY9fWA4gfjPfwMGqtbop3HNtVVP
 KiuLa4YeqB3MFMJE2X8l304svntt8Eymn7TIqZyYKR7LRyVIzXM0iKePL7LAjDdygUcZeViy/nR
 vmSgTAeocWBjwSvc3tK+yt8/p9Mhv4Nt/+WTHY9IPc5lctDWTETpXaOP7BcVFpmGSePA1N368+K
 59bIjubB07ECFy4sQCs5WEd6Ipd/wDVpVcRl2mX1bt/X+I/+WwLL8hrcJ0iQq4FAzR+FwGU+ISJ
 +6f7KS0L/nkPmRNdLmKy9nwW7kgypQkOBo969nZRZnJ2NLZU0wsrlfmWHzmY4ChUUSHgx5nnMkd
 2R323G+7f6T2PThHQPHAJf0ZzFK2zHHPtDoVhsOFrHzHCMXbJqpb+yEtSOmvV+G+MPXHyv2bPJl
 AAVkOdo8yBzBbrxnY6Q==

The flexible array at the end of the mm_struct has changed name in newer
kernels.  Rather than depending on a particular name, we can simply get
the name of the last member (since that is there the flexible array is
always found) and try to use that.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 .../arrays/tst.ctf-dynsized-bounds-runtime.d  | 25 -----------
 .../arrays/tst.ctf-dynsized-bounds-runtime.sh | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 25 deletions(-)
 delete mode 100644 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
 create mode 100755 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh

diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
deleted file mode 100644
index f3801454..00000000
--- a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
- *	      (ensuring the bounds checking is also bypassed at runtime).
- *
- * SECTION: Pointers and Arrays/Array Declarations and Storage
- */
-
-BEGIN
-{
-	i = pid - pid;			/* Non-constant 0 value. */
-	trace(curthread->mm->cpu_bitmap[i]);
-	exit(0);
-}
-
-ERROR
-{
-	exit(1);
-}
diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
new file mode 100755
index 00000000..60fe6afc
--- /dev/null
+++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
@@ -0,0 +1,43 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2023, 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
+#            (ensuring the bounds checking is also bypassed at runtime).
+#
+# SECTION: Pointers and Arrays/Array Declarations and Storage
+
+dtrace=$1
+
+# The mm_struct 'cpu_bitmap' was renamed to 'flexible_array', so we need to
+# see which member name the current kernel uses.  Since it is always the last
+# member of mm_struct, we just use that member name, and hope for the best.
+# If mm_struct ever gets changed to not have a flesible array at its end, this
+# test will need a new structure to work with.
+# are out of luck.
+
+# Determine the member name we should use.
+member=`bpftool btf dump id 1 | \
+		awk '/^\[[0-9]+\] STRUCT \047mm_struct\047/ { in_mm = 1; next; }
+		     /^\t/ && in_mm { fld = $1; gsub(/\047/, "", fld); next }
+		     /^\[[0-9]+\] [A-Z]+ \047/ && in_mm { print fld; exit; }'`
+
+
+# Try to access the flexible array.
+$dtrace $dt_flags -qn "
+BEGIN
+{
+	i = pid - pid;			/* non-constant 0 value */
+	v = curthread->mm->$member[i];
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}"
+
+echo $?
-- 
2.51.0

